module scrambler(/*AUTOARG*/
   // Outputs
   scrambler_out,
   // Inputs
   clk, reset, scrambler_next, scrambler_load,
   scrambler_load_data, scrambler_in
   );
   input clk, reset,
   input scrambler_next,
   input scrambler_load,
   input [57:0] scrambler_load_data;
   input [63:0] scrambler_in;
   output [63:0] scrambler_out;

   logic [57:0]  r;
   logic [63:0]  rn;
   logic         match;


   parameter RESET = 58'h1234567_89abcdef;



   assign rn[63:0] = {r,r[57:52]} ^ {r[38:0],r[38:14]} ^ {39'b0,r[57:39],6'b0};

   assign scrambler_out[63:0] = {r[57:0], rn[63:58]};


   always @(posedge clk or posedge reset) begin
      if (reset) begin
         r <= RESET;
         match <= 1'b0;
      end else begin
         if (scrambler_load) begin
            r[57:0] <= scrambler_load_data[57:0];
         end else if (scrambler_next) begin
            r[57:0] <= rn[57:0];
         end
         match <= (r == scrambler_load_data);
      end
   end
endmodule
