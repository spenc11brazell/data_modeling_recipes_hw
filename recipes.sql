CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email text not null,
    password text not null,
    ip_address text not null
  );

CREATE TABLE followers (
    id SERIAL PRIMARY KEY,
    follower_id INT not null REFERENCES users(user_id),
    followee_id INT not null REFERENCES users(user_id)
  );

  create table posts (
      post_id serial primary key,
      title text not null,
      content text not null,
      image_url text not null,
      created_date TIMESTAMP with time zone not null,
      "location" text not null,
      user_id int not null references users(user_id)
  );

create table updoots (
    updoot_id serial primary key,
    user_id int not null references users(user_id),
    post_id int not null references posts(post_id)
);

create table comments (
    comment serial primary key,
    user_id int not null references users(user_id),
    post_id int not null references posts(post_id),
    body text not null
);

create table groups (
    group_id serial primary key,
    "name" text not null
);

create table groups_users_join (
    id serial primary key,
    user_id int not null references users(user_id),
    group_id int not null references groups(group_id)
);

create table groups_posts_join (
    id serial primary key,
    post_id int not null references posts(post_id),
    group_id int not null references groups(group_id)
);