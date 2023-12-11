class sequence_slv extends uvm_sequence;

     `uvm_object_utils (sequence_slv)

     function new(string name ="sequence_slv");

            super.new(name);

     endfunction 
     
     virtual task body();
            item_req_ack item1;
            item1 = item_req_ack::type_id::create("item1");

            forever begin
            start_item (item1);
            if(!(item1.randomize() with { delay_slv inside {[1:10]}; }))
               `uvm_error(get_type_name(), "Rand error")
            finish_item(item1);

            end
     endtask : body

endclass : sequence_slv