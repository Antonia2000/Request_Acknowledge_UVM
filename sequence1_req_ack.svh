class sequence1_req_ack extends uvm_sequence;

     `uvm_object_utils (sequence1_req_ack)

     function new(string name ="sequence1_req_ack");

            super.new(name);

     endfunction 
     
     virtual task body();
            int unsigned last_data = 0;
            item_req_ack item;
            item = item_req_ack::type_id::create("item");

            for(int i = 1; i<= 20; i++) begin
            start_item (item);
            if(!(item.randomize() with {data > last_data ;
                                        delay == i       ; 
                                        addr % 4 == 0    ; }))
               `uvm_error(get_type_name(), "Rand error")
            finish_item(item);
            last_data = item.data;
            end
     endtask : body

endclass : sequence1_req_ack