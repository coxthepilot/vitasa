import unittest
import sys
import uuid

sys.path.insert(0, ".")
from models.user import User



class TCUserModel(unittest.TestCase):
    
    def test_get_all(self):
        user_list = User.all()

        self.assertEqual(0, len(user_list))
    
    def test_save(self):
        user = User()
        user.guid = str(uuid.uuid4())
        user.email = 'chris@example.org'
        user.password_hash = User.digest('pretend this is hashed')
        user.roles = {'NewUser'}

        save_result = user.save()
        self.assertEqual(200, save_result)
        user.delete()
    

    # Test that the user model will automatically generate the User ID and password_hash for a new user registration
    def test_register(self):
        user = User()
        user.email = 'new-user@example.org'
        user.password = 'new-user-password'
        user.password_confirmation = 'new-user-password'

        save_result = user.save()
        self.assertEqual(200, save_result)
        user.delete()

if __name__ == '__main__':
    unittest.main()
