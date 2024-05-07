// Q1: What fields should go in a UVM sequence item to represent one of the transactions?
//
//
//  This is supposed to be a bit of a "skeleton" file. The code below gives the rough shape. The
//  question is specifically about the fields that should be there. Don't worry about things like a
//  constructor or the stuff that normally goes inside `uvm_object_utils_begin/end.

class my_item extends uvm_sequence_item;

  // TODO: Fill this in!
  // The sequence item must have all the inputs from the interface that is 
  // "catched" by a sequencer and then goes to the driver. (All them in the Agent)

  rand logic        vld_i;
  rand logic        head_i;
  rand logic [2:0]  beats_i;
  rand logic [31:0] data_i;
  logic             rdy_o;

  `uvm_object_utils_begin(my_item)
    // blah blah: don’t bother filling this in
  `uvm_object_utils_end


  //The randomized inputs should be constrained according with the design spec.
  // beats_i and data_i are fully randomized.

  //For every vld_i == 1, has a random data_i
  constraint vld_c { vld_i -> data_i }; 

  //If has vld_i == 1 and head_i == 1, generates random beats_i
  constraint head_c { (vld_i && head_i) -> beats_i && data_i };



endclass
