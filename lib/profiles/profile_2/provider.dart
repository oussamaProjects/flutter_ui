 

import 'package:flutter_ui/profiles/profile_2/user.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
        user: User(
          name: 'Erik Walters',
          address: '677 Adams Bypass',
          about:
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet, assumenda fugiat officia iste, veritatis architecto voluptates quidem tenetur enim quasi, non porro sequi totam asperiores est. Rerum mollitia praesentium fugit.',
        ),
        followers: 12,
        following: 122,
        friends: 100);
  }
}
