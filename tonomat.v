// input introduc bani, butn pentru 3 preturi diferite, output produsul si restul
module tonomat( 
    // ca output vom avea semnalele care vor fi afisate pe ecran
    output reg [4:0] state,
    input [1:0] bani_50,
    input [1:0] bani_1,
    input [1:0] bani_5,
    input [1:0] select_product,
    input clock, reset
    );

    reg [4:0] next_state;
    

    // 20 de stari cu toate preturile de la 0.5 la 10
    parameter [4:0] a0 = 5'd0; //0
    parameter [4:0] a1 = 5'd1; //0.5
    parameter [4:0] a2 = 5'd2; //1
    parameter [4:0] a3 = 5'd3; //1.5
    parameter [4:0] a4 = 5'd4; //2
    parameter [4:0] a5 = 5'd5; //2.5
    parameter [4:0] a6 = 5'd6; //3
    parameter [4:0] a7 = 5'd7; //3.5
    parameter [4:0] a8 = 5'd8; //4
    parameter [4:0] a9 = 5'd9; //4.5
    parameter [4:0] a10 = 5'd10; //5
    parameter [4:0] a11 = 5'd11; //5.5
    parameter [4:0] a12 = 5'd12; //6
    parameter [4:0] a13 = 5'd13; //6.5
    parameter [4:0] a14 = 5'd14; //7
    parameter [4:0] a15 = 5'd15; //7.5
    parameter [4:0] a16 = 5'd16; //8
    parameter [4:0] a17 = 5'd17; //8.5
    parameter [4:0] a18 = 5'd18; //9
    parameter [4:0] a19 = 5'd19; //9.5
    parameter [4:0] a20 = 5'd20; //10

    parameter [1:0] select_product_1 = 2'd1;
    parameter [1:0] select_product_2 = 2'd2;

    always @(posedge clock, posedge reset)
        if (reset)
            begin
                state <= a0;
            end
        else
            state <= next_state;
    always @ (state or bani_50 or bani_1 or bani_5 or select_product) 
        case (state)
            a0:
                if (bani_50 == 2'd1)
                    begin
                        $display("Ai introdus 0.5 lei in tonomat");
                        next_state <= a1;
                    end
                else if (bani_1 == 2'd1)
                    begin 
                        $display("Ai introdus 1 lei in tonomat");
                        next_state <= a2;
                    end
                else if (bani_5 == 2'd1)
                    begin 
                       $display("Ai introdus 5 lei in tonomat"); 
                        next_state <= a10;
                    end
                else if (select_product == select_product_1)
                    begin
                        $display("Nu ai destui bani pentru produsul 1");
                        next_state <= a0;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Nu ai destui bani pentru produsul 2");
                        next_state <= a0;
                    end
                else 
                    next_state <= a0;
            a1: 
                if (bani_50 == 2'd1)
                    next_state <= a2;
                else if (bani_1 == 2'd1)
                    begin
                        $display("Ai introdus 1 lei in tonomat");
                        next_state <= a3;
                    end
                else if (bani_5 == 2'd1)
                    next_state <= a11;
                else if (select_product == select_product_1)
                    begin
                        $display("Nu ai destui bani pentru produsul 1");
                        next_state <= a0;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Nu ai destui bani pentru produsul 2");
                        next_state <= a0;
                    end
                //else 
                    //begin
                       // $display("Primesti 0.5 lei rest");
                       // next_state <= a0;
                   // end
            a2:
                if (bani_50 == 2'd1)
                    next_state <= a3;
                else if (bani_1 == 2'd1)
                    next_state <= a4;
                else if (bani_5 == 2'd1)
                    next_state <= a12;
                else if (select_product == select_product_1)
                    begin
                        $display("Nu ai destui bani pentru produsul 1");
                        next_state <= a0;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Nu ai destui bani pentru produsul 2");
                        next_state <= a0;
                    end
                //else
                  //  begin
                       // $display("Primesti 1 lei rest");
                       // next_state <= a0;
                   // end 
            a3:
                if (bani_50 == 2'd1)
                    next_state <= a4;
                else if (bani_1 == 2'd1)
                    next_state <= a5;
                else if (bani_5 == 2'd1)
                    begin
                     $display("Ai introdus 5 lei in tonomat"); 
                    next_state <= a13;
                    end
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a0;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Nu ai destui bani pentru produsul 2");
                        next_state <= a0;
                    end
                //else 
                  //  begin
                     //   $display("Primesti 1.5 lei rest");
                      //  next_state <= a0;
                   // end
            a4:
                if (bani_50 == 2'd1)
                    next_state <= a5;
                else if (bani_1 == 2'd1)
                    next_state <= a6;
                else if (bani_5 == 2'd1)
                    next_state <= a14;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a1;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Nu ai destui bani pentru produsul 2");
                        next_state <= a0;
                    end
                else 
                    begin
                        $display("Primesti 2 lei rest");
                        next_state <= a0;
                    end
            a5:
                if (bani_50 == 2'd1)
                    next_state <= a6;
                else if (bani_1 == 2'd1)
                    next_state <= a7;
                else if (bani_5 == 2'd1)
                    next_state <= a15;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a2;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Nu ai destui bani pentru produsul 2");
                        next_state <= a0;
                    end
                else 
                    begin
                        $display("Primesti 2.5 lei rest");
                        next_state <= a0;
                    end
            a6:
                if (bani_50 == 2'd1)
                    next_state <= a7;
                else if (bani_1 == 2'd1)
                    next_state <= a8;
                else if (bani_5 == 2'd1)
                    next_state <= a16;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a3;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a0;
                    end
                else 
                    begin
                        $display("Primesti 3 lei rest");
                        next_state <= a0;
                    end
            a7:
                if (bani_50 == 2'd1)
                    next_state <= a8;
                else if (bani_1 == 2'd1)
                    next_state <= a9;
                else if (bani_5 == 2'd1)
                    next_state <= a17;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a4;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a1;
                    end
                else 
                    begin
                        $display("Primesti 3.5 lei rest");
                        next_state <= a0;
                    end
                    
            a8:
                if (bani_50 == 2'd1)
                    next_state <= a9;
                else if (bani_1 == 2'd1)
                    next_state <= a10;
                else if (bani_5 == 2'd1)
                    next_state <= a18;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a5;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a2;
                    end
                else 
                    begin
                        $display("Primesti 4 lei rest");
                        next_state <= a0;
                    end
            a9:
                if (bani_50 == 2'd1)
                    next_state <= a10;
                else if (bani_1 == 2'd1)
                    next_state <= a11;
                else if (bani_5 == 2'd1)
                    next_state <= a19;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a6;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a3;
                    end
                else 
                    begin
                        $display("Primesti 4.5 lei rest");
                        next_state <= a0;
                    end
            a10:
                if (bani_50 == 2'd1)
                    next_state <= a11;
                else if (bani_1 == 2'd1)
                    next_state <= a12;
                else if (bani_5 == 2'd1)
                    next_state <= a20;
                else if (select_product == select_product_1) 
                    begin 
                        $display("Ai cumparat produsul 1");
                        next_state <= a7;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a4;
                    end
                else 
                    begin
                        $display("Primesti 5 lei rest");
                        next_state <= a0;
                    end
            a11:
                if (bani_50 == 2'd1)
                    next_state <= a12;
                else if (bani_1 == 2'd1)
                    next_state <= a13;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a8;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a5;
                    end
                else 
                    begin
                        $display("Primesti 5.5 lei rest");
                        next_state <= a0;
                    end
            a12:
                if (bani_50 == 2'd1)
                    next_state <= a13;
                else if (bani_1 == 2'd1)
                    next_state <= a14;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a9;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a6;
                    end
                else 
                    begin
                        $display("Primesti 6 lei rest");
                        next_state <= a0;
                    end
            a13:
                if (bani_50 == 2'd1)
                    next_state <= a14;
                else if (bani_1 == 2'd1)
                    next_state <= a15;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a10;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a7;
                    end
                //else 
                   // begin
                     //   $display("Primesti 6.5 lei rest");
                     //   next_state <= a0;
                    //end
            a14:
                if (bani_50 == 2'd1)
                    next_state <= a15;
                else if (bani_1 == 2'd1)
                    next_state <= a16;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a11;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a8;
                    end
                else 
                    begin
                        $display("Primesti 7 lei rest");
                        next_state <= a0;
                    end
            a15:
                if (bani_50 == 2'd1)
                    next_state <= a16;
                else if (bani_1 == 2'd1)
                    next_state <= a17;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a12;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a9;
                    end
                else 
                    begin
                        $display("Primesti 7.5 lei rest");
                        next_state <= a0;
                    end
            a16:
                if (bani_50 == 2'd1)
                    next_state <= a17;
                else if (bani_1 == 2'd1)
                    next_state <= a18;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a13;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a10;
                    end
                else 
                    begin
                        $display("Primesti 8 lei rest");
                        next_state <= a0;
                    end
            a17:
                if (bani_50 == 2'd1)
                    next_state <= a18;
                else if (bani_1 == 2'd1)
                    next_state <= a19;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a14;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a11;
                    end
                else 
                    begin
                        $display("Primesti 8.5 lei rest");
                        next_state <= a0;
                    end
            a18:
                if (bani_50 == 2'd1)
                    next_state <= a19;
                else if (bani_1 == 2'd1)
                    next_state <= a20;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a15;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a12;
                    end
                else 
                    begin
                        $display("Primesti 9 lei rest");
                        next_state <= a0;
                    end
            a19:
                if (bani_50 == 2'd1)
                    next_state <= a20;
                else if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a16;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a13;
                    end
                else 
                    begin
                        $display("Primesti 9.5 lei rest");
                        next_state <= a0;
                    end
            a20:
                if (select_product == select_product_1)
                    begin
                        $display("Ai cumparat produsul 1");
                        next_state <= a17;
                    end
                else if (select_product == select_product_2)
                    begin
                        $display("Ai cumparat produsul 2");
                        next_state <= a14;
                    end
                else 
                    begin
                        $display("Primesti 10 lei rest");
                        next_state <= a0;
                    end
        endcase
endmodule
