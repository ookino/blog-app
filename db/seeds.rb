
user_1 = User.create(id: 1, name: "Yaseer", photo: "https://images.unsplash.com/photo-1645655144330-08d6ae83054b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80", bio: "this some bio, some bio", posts_counter: 2)
user_2 = User.create(id: 2, name: "Okino", photo: "https://images.unsplash.com/photo-1645701180165-92df752b4cf4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80", bio: "this some bio, some bio", posts_counter: 2)

post_1 = Post.create(user_id: 2, title: 'who would know', text: 'editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', comments_counter: 2, likes_counter: 1)
post_2 = Post.create(user_id: 1, title: 'Continue the story', text: 'editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', comments_counter: 2, likes_counter: 0)
post_3 = Post.create(user_id: 1, title: 'damn, the story ', text: 'editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', comments_counter: 0, likes_counter: 0)
post_4 = Post.create(user_id: 2, title: 'why would you do thar', text: 'editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', comments_counter: 0, likes_counter: 0)

Comment.create(post_id: post_1.id, user_id: user_2.id, text: 'This is  one of the comments' )
Comment.create(post_id: post_2.id, user_id: user_1.id, text: 'This is  one of the comments' )
Comment.create(post_id: post_2.id, user_id: user_1.id, text: 'This is  one of the comments' )
Comment.create(post_id: post_1.id, user_id: user_2.id, text: 'This is  one of the comments' )

Like.create(user_id: user_1.id, post_id: post_1.id)

