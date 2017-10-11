<?php
/*  Copyright 2017  William M Cox (email: billy.cox@zsquared.net)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/
    // ------ get a list of all order ids -----
    // Returns all OrderIds in the system, regardless of state
    function GetAllOrderIds($conn) {
        // build a list of unique order id's; we will send one email per unique order id
        //   but summarize everything in that order
        $sql = "SELECT * FROM wp_woocommerce_order_items";
        $result = mysqli_query($conn, $sql);
        $orderIds = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $orderId = $row["order_id"];
            $orderItemType = $row["order_item_type"];
            if ((!in_array($orderId, $orderIds)) && ($orderItemType == "line_item"))
                array_push($orderIds, $orderId);
        }
        return $orderIds;
    }

    // ------ get a list of all order ids -----
    // Returns all OrderIds in the system, regardless of state
    function GetInProcessOrderIds($conn) {
        // build a list of unique order id's; we will send one email per unique order id
        //   but summarize everything in that order
        // this gets a list of all order id's regardless of state (trashed, on-hold, completed)
        $orderIds = GetAllOrderIds($conn);

        // now we need to filter these based on state; we reject if
        //   _wp_trash_meta_status is found - this means the order was trashed
        //   _date_paid has no value        - this means the order is on-hold for payment
        //   _date_completed has a value    - this means the order is complete

        // start the list of orderIds that have passed our tests
        $inProcessingOrderIds = array();

        // scan through the orderIds, checking each
        foreach ($orderIds as $orderId) {

            $sql = "SELECT * FROM wp_postmeta WHERE post_id=$orderId";
            $result = mysqli_query($conn, $sql);

            $isTrashed = false;
            $isComplete = false;
            $isPaid = false;

            while ($row = mysqli_fetch_assoc($result)) {
                $mk = $row["meta_key"];
                if ($mk == "_wp_trash_meta_status")
                    $isTrashed = true;
                elseif ($mk == "_date_completed") {
                    $dc = $row["meta_value"];
                    if (strlen($dc) > 0)
                        $isComplete = true;
                }
                elseif ($mk == "_date_paid") {
                    $dp = $row["meta_value"];
                    if (strlen($dp) > 0)
                        $isPaid = true;
                }
            }

            if (!$isTrashed && !$isComplete && $isPaid)
                array_push($inProcessingOrderIds, $orderId);
        }

        return $inProcessingOrderIds;
    }

    function GetOrderAttributesForOrderId($conn, $orderId) {
        $attributes = array();

        $sql = "SELECT * FROM wp_postmeta WHERE post_id=$orderId";
        $result = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_assoc($result)) {
            $mk = $row["meta_key"];
            if ($mk == "_billing_email") {
                $attributes["email"] = $row["meta_value"];
            }
            elseif ($mk == "_billing_first_name") {
                $attributes["first_name"] = $row["meta_value"];
            }
            elseif ($mk == "_billing_last_name") {
                $attributes["last_name"] = $row["meta_value"];
            }
            elseif ($mk == "_completed_date") {
                $dc = $row["meta_value"];
                if (strlen($dc) > 0)
                    $attributes["complete"] = true;
            }
            elseif ($mk == "_billing_phone") {
                $bp = $row["meta_value"];
                $attributes["phone"] = $bp;
            }
        }

        return $attributes;
    }

    // For a given order, get the line items for that order
    function GetOrderItemIdsForOrderItem($conn, $orderId) {
        $orderItemIds = array();

        $sql2 = "SELECT * FROM wp_woocommerce_order_items WHERE order_id=$orderId";
        $result2 = mysqli_query($conn, $sql2);

        while ($row2 = mysqli_fetch_assoc($result2)) {
            $orderItemId = $row2["order_item_id"];
            $orderItemType = $row2["order_item_type"];
            if ($orderItemType == "line_item")
                array_push($orderItemIds, $orderItemId);
        }
        return $orderItemIds;
    }

    function GetProductDetailsForOrderItemId($conn, $orderItemId) {
        $details = array();

        // use the order_itemmeta to locate the product id, variation id, quantity
        $sql3 = "SELECT * FROM wp_woocommerce_order_itemmeta WHERE order_item_id=$orderItemId";
        $result3 = mysqli_query($conn, $sql3);
        $productId = "";
        $variationId = "";
        while ($row3 = mysqli_fetch_assoc($result3)) {
            $mk = $row3["meta_key"];
            if ($mk == "_product_id") {
                $productId = $row3["meta_value"];
            }
            elseif ($mk == "_variation_id") {
                $variationId = $row3["meta_value"];
            }
            elseif ($mk == "_qty") {
                $details["qty"] = $row3["meta_value"];
            }
            elseif ($mk == "_line_total") {
                $details["total"] = $row3["meta_value"];
            }

            $postId = $productId;
            if (strlen($variationId) > 0)
                $postId = $variationId;
            $details["product_id"] = $postId;

            $sql4 = "SELECT * FROM wp_posts WHERE ID=$postId";
            $result4 = mysqli_query($conn, $sql4);
            while ($row4 = mysqli_fetch_assoc($result4)) {
                $details["name"] = $row4["post_title"];
                break;
            }

            $sql5 = "SELECT * FROM wp_postmeta WHERE post_id=$postId";
            $result5 = mysqli_query($conn, $sql5);
            while ($row5 = mysqli_fetch_assoc($result5)) {
                if ($row5["meta_key"] == "_sku") {
                    $details["sku"] = $row5["meta_value"];
                    break;
                }
            }
        }

        return $details;
    }
?>