Runes
======

Runes is a Railtie to index your models using the modern Elasticsearch as backend, which have possibilities ranging from a simple single-node index manipulation to a highly populated cluster.

Elasticsearch
-------------

Elasticsearch is a powerful easy-to-use search engine built on top of Apache Lucene. It aims to solve many problems found when search is needed providing an amazing RESTful interface and complete ability to scale using a innovative distributed architecture. For more information check their [website](http://www.elasticsearch.org/).

Getting started
-------------

First of all, this plugin was designed using the new Railtie architecture, so it's only supported by Rails 3. If you are new to elasticsearch I encourage you to install it using their [installation guide](http://www.elasticsearch.org/guide/reference/setup/installation.html).

Install the latest gem in the conventional manner:

    gem install runes

Specify the models you want to index:

    class Cake < ActiveRecord::Base
      acts_as_indexable
    end

After you have installed Runes and specified the models just fire your Rails app. Voila! You are able to index and search.

    Cake.create!(:name => "chocolate", :category => "fatty")
    Cake.search("chocolate")

Author
------

Stephano Zanzin :: me@zan.st :: zanst @ Freenode

NOTICE
------

Work in progress, if you are not a code diver I recommend wait for a tag.
