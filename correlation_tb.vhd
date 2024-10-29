LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.STD_LOGIC_SIGNED.all  ;

library std;
use std.textio.ALL;  
ENTITY correlation_tb  IS 
END ; 
 
ARCHITECTURE correlation_tb OF correlation_tb IS
  SIGNAL Corr_symbole   :  std_logic_vector (16 downto 0)  ; 
  SIGNAL In_re   :  std_logic_vector (11 downto 0)  ; 
  SIGNAL Corr_trame   :  std_logic_vector (18 downto 0)  ; 
  SIGNAL Evalue   :  STD_LOGIC  ; 
  SIGNAL CLK   :  STD_LOGIC  ; 
  SIGNAL RSTn   :  STD_LOGIC  ; 
  COMPONENT correlation  
    PORT ( 
      Corr_symbole  : out std_logic_vector (16 downto 0) ; 
      In_re  : in std_logic_vector (11 downto 0) ; 
      Corr_trame  : out std_logic_vector (18 downto 0) ; 
      Evalue  : in STD_LOGIC ; 
      CLK  : in STD_LOGIC ; 
      RSTn  : in STD_LOGIC ); 
  END COMPONENT ; 
   COMPONENT timer is
   port (RSTn : in std_logic;
      CLK  : in std_logic;
      Evalue : out std_logic);
   end component;
BEGIN
  DUT  : correlation  
    PORT MAP ( 
      Corr_symbole   => Corr_symbole  ,
      In_re   => In_re  ,
      Corr_trame   => Corr_trame  ,
      Evalue   => Evalue  ,
      CLK   => CLK  ,
      RSTn   => RSTn   ) ; 
    
  timer0 : timer
    port map (RSTn => RSTn,
      CLK  => CLK,
      Evalue => Evalue);
      
      
RSTn <= '0', '1' after 15 ns;
      
P: process
begin
  clk <= '0';
  wait for 10 ns;
  clk <= '1';
  wait for 10 ns;
end process P;

LECTURE_data : process
  variable L	: LINE; 
  file ENTREE	: TEXT is in	"in_re5_chan2.txt";
  variable A	: integer;
  begin
    WAIT UNTIL CLK'EVENT AND CLK='0';
    LOOP 
        WAIT UNTIL CLK'EVENT AND CLK='0';
	         READLINE(ENTREE, L);
	         READ(L,A);
	         In_re	<= conv_std_logic_vector(A,12); 

    END LOOP;
end process LECTURE_data;
END ; 



