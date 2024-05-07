// Q2. What should the monitor for this block look like?
//
//  This is supposed to be a bit of a "skeleton" file. The code below gives the rough shape and the
//  aim is to fill in the run_phase task. Don't wory about the other phases or any other macro
//  boilerplate.

class my_monitor extends uvm_monitor;
  uvm_analysis_port #(my_item) analysis_port;
  virtual my_interface         vif;

  // Don’t worry about all the UVM macro boilerplate, build phase
  // etc. We’re just interested in the run_phase method

  task run_phase(uvm_phase phase);
    //Sequence Item that will store the information from the interface.
    my_item item_obj;

    forever begin
      @(posedge vif.clk);
      if(vif.rdy_o) begin

        //Instantiate a new sequence item to catch the information from the interface
        item_obj = my_item::type_id::create ("item_obj", this);

        item_obj.vld_i   = vif.vld_i;
        item_obj.rdy_o   = vif.rdy_o;
        item_obj.head_i  = vif.head_i;
        item_obj.beats_i = vif.beats_i;
        item_obj.data_i  = vif.data_i;

        `uvm_info("monitor", $sformatf("Valid transaction: valid=%h, data=%h", item_obj.beats_i, item_obj.data_i), UVM_LOW)

        //Broadcast the transaction to be used by other uvm component, like scoreboard, coverage collector...
        analysis_port.write(item_obj);
      end

  endtask

endclass
