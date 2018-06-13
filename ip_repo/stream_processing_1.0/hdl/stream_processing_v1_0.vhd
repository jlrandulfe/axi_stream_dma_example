library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stream_processing is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M00_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk	: in std_logic;
		m00_axis_aresetn: in std_logic;
		m00_axis_tvalid	: out std_logic;
		m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tstrb	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m00_axis_tlast	: out std_logic;
		m00_axis_tready	: in std_logic;

		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk	: in std_logic;
		s00_axis_aresetn: in std_logic;
		s00_axis_tready	: out std_logic;
		s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tstrb	: in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s00_axis_tlast	: in std_logic;
		s00_axis_tvalid	: in std_logic
	);
end stream_processing;

architecture arch_imp of stream_processing is

	-- component declaration

    component stream_algorithm is
        generic (
        C_S_AXIS_TDATA_WIDTH	: integer	:= 32
        );
        port(
        data_in     : in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
        data_out    : out std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0)
        );
    end component stream_algorithm;

    signal my_value : std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    
begin

-- Instantiation of the block with the main algorithm
	
stream_algorithm_inst : stream_algorithm
    port map (
        data_in     => s00_axis_tdata,
        data_out    => my_value
    );
    
    m00_axis_tvalid <= s00_axis_tvalid;
    m00_axis_tdata <= my_value;
    m00_axis_tstrb <= s00_axis_tstrb;
    m00_axis_tlast <= s00_axis_tlast;
    s00_axis_tready <= m00_axis_tready;
    
end arch_imp;
