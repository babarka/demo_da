# Demo of method for GLM
Vagrant File with box and jupyter notebooks to demonstrate training a GLM in the follow four frameworks; pyspark, sparkr, python h2o, & r h2o. 

# Instruction:
Insure that you have [git](https://git-scm.com/downloads) installed, [vagrant](https://www.vagrantup.com/) installed & [virtualbox](https://www.virtualbox.org/) installed. You must be on cloudera's internal network to access the internal github repository. Then;

    git clone http://github.mtv.cloudera.com/barker/demo_da.git
    cd demo_da
    vagrant up

It'll take a while to download files. Once complete, vagrant will start up a quickstart vm and initiate the cluster. Then it will start jupyter. You can navigate to jupyter in your browser by navigating to:

[http://localhost:8890](http://localhost:8890)

The password is 'cloudera'. Run each of the four notebooks to see different frameworks for training a GLM.
