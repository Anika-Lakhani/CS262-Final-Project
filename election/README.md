contracts directory: this is where all smart contacts live.
We already have a Migration contract that handles our migrations to the blockchain.

migrations directory: this is where all of the migration files live.
These migrations are similar to other web development frameworks that require migrations to change
the state of a database. Whenever we deploy smart contracts to the blockchain, we are updating the
blockchain's state, and therefore need a migration.

node_modules directory: this is the home of all of our Node dependencies.

src directory: this is where we'll develop our client-side application.

test directory: this is where we'll write our tests for our smart contracts.

truffle.js file: this is the main configuration file for our Truffle project

Let's also take note of a few other things that came with the Truffle Pet Shop box like the
Bootstrap framework that will keep us from having to write any CSS in this tutorial.
We also got lite-server, which will serve our assets for development purposes.