# address-book-ruby-cmdline

Working on my ruby skills. This program just performs CRUD operations on a contact list that
is stored in a json file. It also has a simple command line interface for the use to perform
all the operations.

# How To Run

The first step is to install the dependencies. You need ruby and gem installed to the the application

```sh
$ gem install colorize dotenv
```

After installing the all the dependencies, run the following command

```sh
$ mv .env.example .env
```

You can edit the file *.env* file to point to another database file.

> :warning: **The database file must exist. It should also contain valid json data.**

```sh
DB_PATH="db.example.json"
```

Finally to run the application

```sh
$ ruby main.rb
```