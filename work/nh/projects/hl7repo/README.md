# Introduction 
A repository for inbound and outbound HL7 messages received and sent out from Northern Health Rhapsody integration engine. 

# Design
![design-diagram](hl7repo-design-architecture.jpg)
# Componenets
TODO: Add a brief list of all components used in this project, their main functionality and their interconnectivity.
## HL7 Listener
Listens on a TCP port for messages and writes to the Redis cache
## Database Writer
Reads messages from filesystem and Redis cache, and insert data in batches into the database

### Database Writer
Inserts data into the database. These messages could be from filesystem or  cache.
### Cache Service
Retrieves messages stored temporarily in the Redis cache
### File Processor
Reads files in a specified directory, parses HL7 messages and passes the data to the `Database Writer` class. In order to prevent memory issues, a configurable limit of maximum file size is set.

## Web API
Retrieves messages from database and cache (for most recent messages) and exposes REST API for the web client.
## Web client
User interface where users can view and search for messages. Content of messages are parsed to display HL7 fields interactively.

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can install, use or extend this project. 

# Third-party tools
TODO: Add all server-side, client-side etc. packages used in this project along with the version installed.