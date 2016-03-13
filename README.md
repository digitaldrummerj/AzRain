# AzRain

The UI is an electron application that uses Angular JS for the UI interaction.  The backend uses MS SQL Server database and is exposed through RestFul services created with [Strongloop](http://www.strongloop.com). 

## General Install Instructions

1. Install Node JS - [http://nodejs.org](http://nodejs.org)
1. Install Git - [http://git-scm.com](http://git-scm.com)
1. Clone this repository using the git clone command

```
$ git clone https://github.com/CombatWombat27/AzRain.git
```

## UI Setup Instructions

### Install Npm Global Dependencies

1. Open Command Prompt
1. Run 

```
$ npm install -g bower gulp
```

### Install Project Dependencies


1. Navigate to the directory that you cloned this repository into and go into the electronSample directory
1. Run the following commands:

```
npm install
bower install
```

## Api Setup Instructions

1. You need to first install Strongloop

```
npm install -g strongloop
```

1. Navigate to the directory that you cloned this repository into and go into the api directory
1. Run the following commands:

```
npm install
```

## Running Api

1. To start the Api run:

```
node .
``` 

## Running UI

1. Make sure that the Api is up and running
1. Navigate to the directory that you cloned this repository into and go into the electronSample directory
1. Run the following commands:

```
gulp run
```

