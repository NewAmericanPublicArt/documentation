# Electrical control box AKA the brain #

The brain of each tower is a Teensy 3.2 carried by a RocketDMX inside a waterproof box tucked under the aluminum pallet on top of each tower.

Note that the neutral and safety ground wires (white and green) are backwards on the power supply. My fault! Don't do that!

<img src="../img/brain-enclosure.jpg" width="750">

<img src="../img/brain-enclosure-connectors.jpg" width="750">

<img src="../img/brain-pallet.jpg" width="750">

<img src="../img/pir-sensor-with-3d-printed-housing.jpg" width="750">


# RocketDMX #

Source files for the RocketDMX board I designed: [RocketDMX](https://github.com/rascalmicro/rocketdmx/)

I think the schematic below is accurate except for the SPI Flash chip DO connection, which was added on the second rev of the PCB. But, I ran out of time before getting the chip working anyway, so whatever.

<img src="../img/blue-hour-baltimore-schematic.jpg" width="750">

<img src="../img/rocketdmx-2016-02-26.png" width="750">

<img src="../img/rocket-dmx-design-and-parts-list.jpg" width="750">