import unittest
import sys
sys.path.insert(0, ".")
from models.user import User



class TCUserModel(unittest.TestCase):
    
    def test_get_all(self):
        user_list = User.all()

        self.assertEqual(0, len(user_list))
    
    def test_save(self):
        user = User()
        user.email = 'chris@example.org'
        user.password_hash = 'pretend this is hashed'
        user.roles = ['NewUser']

        save_result = user.save()
        self.assertEqual(200, save_result)
    

if __name__ == '__main__':
    unittest.main()
