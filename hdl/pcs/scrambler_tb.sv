module scrambler_tb;
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input                clk;                    // To s of scrambler.v
   input                reset;                  // To s of scrambler.v
   input [63:0]         scrambler_in;           // To s of scrambler.v
   input                scrambler_load;         // To s of scrambler.v
   input [57:0]         scrambler_load_data;    // To s of scrambler.v
   input                scrambler_next;         // To s of scrambler.v
   // End of automatics
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [63:0]          descrambler_out;        // From d of descrambler.v
   wire [63:0]          scrambler_out;          // From s of scrambler.v
   // End of automatics
   scrambler #(.RESET(58'h2382_2123_2123)) s(/*AUTOINST*/
               // Outputs
               .scrambler_out           (scrambler_out[63:0]),
               // Inputs
               .clk                     (clk),
               .reset                   (reset),
               .scrambler_next          (scrambler_next),
               .scrambler_load          (scrambler_load),
               .scrambler_load_data     (scrambler_load_data[57:0]),
               .scrambler_in            (scrambler_in[63:0]));

   descrambler d(.descrambler_in(scrambler_out[63:0]),
                 /*AUTOINST*/
                 // Outputs
                 .descrambler_out       (descrambler_out[63:0]));


   initial begin
        $display("Hello, World");
        $finish;
   end
endmodule
