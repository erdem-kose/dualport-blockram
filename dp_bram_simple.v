module relatively_mundane_sdp_ram #(
    parameter DATA = 72,
    parameter ADDR = 10
) (
    // Shared
    input   wire                clk,
 
    // Write Port
    input   wire                wr,
    input   wire    [ADDR-1:0]  wr_addr,
    input   wire    [DATA-1:0]  wr_data,
 
    // Read Port
    input   wire    [ADDR-1:0]  rd_addr,
    output  wire    [DATA-1:0]  rd_data
);
 
// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];
 
// Write Port
always @(posedge clk)
    if(wr)
        mem[wr_addr] <= wr_data;
 
// Read Port
reg [ADDR-1:0] rd_addr_reg;
always @(posedge clk)
    rd_addr_reg <= rd_addr;
 
assign rd_data = mem[rd_addr_reg];
 
endmodule