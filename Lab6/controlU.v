module controlUnit(Op,regdst,jmp,aluop,alusrc,memwrite,memread,branch,regwrite,memtoreg);
	input[5:0] Op;
	output regdst,jmp,alusrc,memwrite,memread,branch,regwrite,memtoreg;
	output[1:0] aluop;
	wire rformat,lw,sw,beq,jp;
	assign rformat = (~Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(~Op[1])&(~Op[0]);
	assign lw = (Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(Op[1])&(Op[0]);
	assign sw = (Op[5])&(~Op[4])&(Op[3])&(~Op[2])&(Op[1])&(Op[0]);
	assign beq = (~Op[5])&(~Op[4])&(~Op[3])&(Op[2])&(~Op[1])&(~Op[0]);
	assign jp = (~Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(Op[1])&(~Op[0]);
	assign jmp = jp;
	assign alusrc = lw|sw;
	assign aluop[0] = beq;
	assign aluop[1] = rformat;
	assign regdst = rformat;
	assign memwrite = sw;
	assign memread = lw;
	assign branch = beq;
	assign memtoreg = lw;
endmodule
