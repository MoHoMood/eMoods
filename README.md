https://parse-dashboard.back4app.com/apps/7eb09169-68d1-437c-9057-6ba654b422d6/browser/_User

# eMoods

https://hackmd.io/EDetK-zSSNWr8AvLt3VAcw#Product-Spec


## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
The mood tracker 
- share my mood with others and comment/react/like on each others mood. -> use Twitter
- Update mood everyday with an emoji (or can add comments) -> Twitter
- After tracking mood for a week, based on the mood, app recommends quotes or things that might be helpful to the user. -> use tracking/quotes API
- Calendar shows the most-used emoji on each day.
- Follow people.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Life Style
- **Mobile:** mobile first experience, may develop website further
- **Story:** User can update their mood with emojis, share with friends, follow people, chat, and get helpful recommendations based on their mood. Be self awared about their moods and try working on them.
- **Market:** Anyone that wants to track or share their mood, if preferred, can reveal identity or be anonymous.Comment or put "reaction" emojis to others'posts. Follow people. Feel comfort from recommendations.
- **Habit:** User can post throughout the day many times. As mood changes frequently, users can post repeatedly which will form habit. 
- **Scope:**"   " will start with posts, comments, react buttons, calendar, follow people, and quotes recommendation.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can log in and log out.
* User can update their name in their account page.
* User can update their mood (use of emoji is mandatory but comments are optional )
* User can see/comment/react to others' post. 



**Optional Nice-to-have Stories**

* User can get quote recommendations based on their mood.
* User can track their mood in in-app calendar.
* User can follow other users.


### 2. Screen Archetypes

* Launch Screen
   * We can see the Logo/Name of the app
  
* Login Screen
   * User can log in

* SignUp Screen
   * User can sign up

* Feed Screen
   * User can see/comment/react to posts. There will be "account" button and "post" button. (optional: There will be follow button beside the username.)
 
* Account Screen
  * User can update their account (account name, email, password, log out) (optional: can tap into the follow screen)

* Post Screen
  * User can post their moods here (with mandatory emojis and optional writing) 

* Comment Screen
  * User can comment on a post and also see others' comments for a post
 
* PasswordChange Screen
  * User can change password

* UsernameChange Screen
  * User can change password

* Deactivate Screen
  * User can delete their count

 OPTIONAL SCREEN
 
* Calendar Screen
    * There is a calendar where users can track their mood through the emojis they posted

* FollowingPost Screen
   * User can see the posts of users that they follow
   * User can unfollow someone

* Follower Screen
   * User can see their followers

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Account
* Feed
* Post

Optional:
* Calendar

**Flow Navigation** (Screen to Screen)

* Login Screen
   * if have account - sign in
   * if no account -> SignUp Screen
* Account Screen
   * Change name -> UsernameChange Screen
   * Log out
   * Delete account -> Deactivate Screen
   * Change password -> PasswordChange Screen
   * Optional: -> FollowingPost Screen/Follower Screen
* Feed Screen
   * React
   * Follow user
   * -> Comment Screen
* Post Screen
   * Post
   * Write a post
   * Emojis
* Comment Screen
   * Write a comment for a post
   * See others' comments for the post

Optional:
* Calendar Screen
   * See the past posts
   * Most frequent emojis

## Wireframes
<img src="https://user-images.githubusercontent.com/86068048/157973460-5fb0d2f7-1699-4f19-9171-cd8cd3b972e0.jpg" width=600>

### Digital Wireframes & Mockups
![WireFrame](https://user-images.githubusercontent.com/92611620/157973623-a75b56ed-908d-452a-919d-680b1304600f.png)

### Interactive Prototype
![ezgif-4-d44d054f2e](https://user-images.githubusercontent.com/86068048/157974303-d77324bc-f7fd-42d7-a630-99c3c045715d.gif)


## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| post author |
   | emoji         | File     | emoji that user chooses |
   | caption       | String   | caption by user |
   | commentsCount | Number   | number of comments that has been posted to an image |
   | comments      | List     | comments |
   | likesCount    | Number   | number of likes for the post |
   | createdAt     | DateTime | date when post is created (default field) |

#### User Profile
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userName      | String   | unique name for the user (default field) |
   | posts         | List     | list of former posts the user has posted |
   | follower      | List     | List of other users that follow this user |
   | followerCount | Number   | number of followers that this user has |
   | following     | List     | List of other users that this user follows |
   | followingCount| Number   | number of other users that this user follows |

### Networking
#### List of network requests by screen
   - Login Screen
      - (Read/GET) Login information
   - SignUp Screen
      - (Create/POST) Create a user object
   - Feed Screen
      - (Read/GET) Query all posts
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
   - Comment Screen
      - (Create/POST) Create a new comment on a post
      - (Read/GET) Query all comments of the post
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Read/GET) Query all posts the user post
   - UsernameChange Screen
      - (Update/GET) Update username
   - PasswordChange Screen
      - (Read/GET) Query original password
      - (Update/GET) Update password
   - Deactivate Screen
      - (Delete) Delete the user object
   Optional:
   - Calendar Screen
      - (Read/GET) Users's past emojis in posts
   - Following Screen
      - (Read/GET) Posts of other users the user follows
      - (Delete) Delete people they follow
   - Follower Screen
      - (Read/GET) User's followers
   
