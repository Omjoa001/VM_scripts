#!/bin/env bash

## Installs and starts cockroach db

# Install
wget https://binaries.cockroachdb.com/cockroach-v20.2.4.linux-amd64.tgz
tar xzf cockroach-v20.2.4.linux-amd64.tgz
cp cockroach-v20.2.4.linux-amd64/cockroach /usr/local/bin


# This hasn't been tested
# Run
mkdir /bfdata
cockroach start --insecure --store=/bfdata --listen-addr=0.0.0.0:26257 --http-addr=0.0.0.0:8080 --background --join=localhost:26257
cockroach init --insecure --host=localhost:26257


# This should be done manually, prob
# cockroach sql --insecure --host=localhost:26257
#
# CREATE DATABASE spelunk;
# CREATE USER spelunkuser;
# GRANT ALL ON DATABASE spelunk TO spelunkuser;
#
# USE spelunk;
# CREATE table users ( userID INT PRIMARY KEY DEFAULT unique_rowid(), name STRING(50), picture STRING(300), status STRING(10), posts INT, comments INT, lastPostDate TIMESTAMP DEFAULT NOW(), createDate TIMESTAMP DEFAULT NOW());
# CREATE table posts ( postID INT PRIMARY KEY DEFAULT unique_rowid(), userID INT, text STRING(300), name STRING(150), postDate TIMESTAMP DEFAULT NOW());
# CREATE table comments ( commentID INT PRIMARY KEY DEFAULT unique_rowid(), postID INT, userID INT, text STRING(300),  postDate TIMESTAMP DEFAULT NOW());
# CREATE table pictures ( pictureID STRING(300), picture BYTES );
