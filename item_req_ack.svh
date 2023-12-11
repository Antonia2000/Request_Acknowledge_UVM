
class item_req_ack extends uvm_sequence_item;

    rand logic [31:0] data ;
    rand int          delay;
    rand int          delay_slv;
    rand logic [31:0]  addr;

`uvm_object_utils_begin(item_req_ack)
     `uvm_field_int( data, UVM_DEFAULT)
     `uvm_field_int( delay, UVM_DEFAULT)
     `uvm_field_int( addr, UVM_DEFAULT)
`uvm_object_utils_end

function new(string name = "item_req_ack");

   super.new(name);

endfunction

//constraint at_least_1 { delay_slv inside {[1:20]};}
 

endclass: item_req_ack