# A system for building systems

Gaudi is meant to provide a consistent command line interface to every task and operation required in the development of your software with the express focus on making automated use easier.

![Buildsystem responsibilities](BuildSystem.png)

The [list of goals](https://github.com/damphyr/gaudi/blob/main/doc/ASPIRATIONS.md) we are trying to fullfill is

## Just the Repository

* I will be able to recreate my software with just the repository
* I will be able to recreate my software development environment with just the repository
* I will be able to build, run, deploy and test my software with just the repository

## One Source of Truth

* When something changes, it only changes in one place
* When I need to find something out, I look in one place

## We Are All Experts

* I can do all the things without knowing all the details

## Out of Source Builds

* Artifacts created by the build system are separate from the sources we use to create them
* No build artifact is commited to the repository. Ever.

## Breadcrumbs everywhere

* At any point in time I am able to exactly reproduce the commands up to that point
* I have a record or every command executed by the system

(also known as [Ariadne's thread](https://en.wikipedia.org/wiki/Ariadne%27s_thread_(logic)))

----
| [Approach](Approach.md)