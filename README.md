# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, add_index:true|
|email|string|null: false, unique:true|
|password|string|null: false|
|password confirmation|string|null: false|

### Association
- has_many :groups_users
- has_many :groups, through: groups_users
- has_many :messages

## messagesテーブル
|Column|Type|Option|
|------|----|------|
|body|text|
|image|string|
|groups_id|integer|null: false, foreign_key:true|
|users_id|integer|null: false, foreign_key:true|

### Association
- belongs_to :group
- belong_to :user

## groupsテーブル

|Column|Type|Option|
|------|----|------|
|groups_name|string|null: false|

### Association
- has_many :groups_users
- has_many :users, through: groups_users
- has_many :messages

## groups_usersテーブル

|Column|Type|Option|
|------|----|------|
|users_id|integer|null: false, foreign_key:true|
|groups_id|integer|null: false, foreign_key:true|

### Association
- belongs_to :group
- belong_to :user
