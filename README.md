# address-book-ruby-cmdline

Working on my ruby skills. This program just performs CRUD operations on a contact list that
is stored in a json file. It also has a simple command line interface for the use to perform
all the operations.

# How To Run

The first step is to install the dependencies. You need ruby and gem installed to the the application

```console
$ gem install colorize dotenv
```

After installing the all the dependencies, run the following command

```console
$ mv .env.example .env
```

You can edit the file *.env* file to point to another database file.

<div class="panel panel-info">
NOTE
<div class="panel-body">
The database file must exist. It should also contain valid json data.
</div>
</div>

```dotenv
DB_PATH="db.example.json"
```

Finally to run the application

```console
$ ruby main.rb
```