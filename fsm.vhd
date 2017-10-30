-- fsm.vhd: Projekt pristupovy termin
-- Author: Igor Ignac - xignac00 
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (TEST1, TEST2, TEST3, TEST4_kod1, TEST4_kod2, TEST5_kod1, TEST5_kod2, TEST6_kod1, TEST6_kod2, TEST7_kod1, TEST7_kod2, TEST8_kod1, TEST8_kod2, TEST9_kod1, TEST9_kod2, TEST10_kod1, TEST10_kod2, TEST11_kod2, TEST12_kod2, PRINT_MESSAGE_OK, PRINT_MESSAGE_NOK, WAIT_NOK, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= TEST1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST1 =>
      next_state <= TEST1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(8) = '1') then
			next_state <= TEST2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST2 =>
      next_state <= TEST2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(1) = '1') then
			next_state <= TEST3;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST3 =>
      next_state <= TEST3;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(1) = '1') then
			next_state <= TEST4_kod1;
		elsif (KEY(8) = '1') then
			next_state <= TEST4_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST4_kod1 =>
      next_state <= TEST4_kod1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(8) = '1') then
			next_state <= TEST5_kod1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST4_kod2 =>
      next_state <= TEST4_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(0) = '1') then
			next_state <= TEST5_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST5_kod1 =>
      next_state <= TEST5_kod1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(1) = '1') then
			next_state <= TEST6_kod1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST5_kod2 =>
      next_state <= TEST5_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(0) = '1') then
			next_state <= TEST6_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST6_kod1 =>
      next_state <= TEST6_kod1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(4) = '1') then
			next_state <= TEST7_kod1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST6_kod2 =>
      next_state <= TEST6_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(8) = '1') then
			next_state <= TEST7_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST7_kod1 =>
      next_state <= TEST7_kod1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(8) = '1') then
			next_state <= TEST8_kod1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST7_kod2 =>
      next_state <= TEST7_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(5) = '1') then
			next_state <= TEST8_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST8_kod1 =>
      next_state <= TEST8_kod1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(7) = '1') then
			next_state <= TEST9_kod1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST8_kod2 =>
      next_state <= TEST8_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(2) = '1') then
			next_state <= TEST9_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST9_kod1 =>
      next_state <= TEST9_kod1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(5) = '1') then
			next_state <= TEST10_kod1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST9_kod2 =>
      next_state <= TEST9_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(8) = '1') then
			next_state <= TEST10_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST10_kod1 =>
      next_state <= TEST10_kod1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_OK;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST10_kod2 =>
      next_state <= TEST10_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(8) = '1') then
			next_state <= TEST11_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST11_kod2 =>
      next_state <= TEST11_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_NOK;
		elsif (KEY(0) = '1') then
			next_state <= TEST12_kod2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST12_kod2 =>
      next_state <= TEST12_kod2;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_OK;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WAIT_NOK;	
			
      end if;		
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_OK =>
      next_state <= PRINT_MESSAGE_OK;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_NOK =>
      next_state <= PRINT_MESSAGE_NOK;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;	
   -- - - - - - - - - - - - - - - - - - - - - - -
	when WAIT_NOK =>
		next_state <= WAIT_NOK;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_NOK;
		end if;	
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= TEST1; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= TEST1;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_OK =>
		FSM_MX_MEM		<= '1';
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_NOK =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';			
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
		if (KEY(14 downto 0) /= "000000000000000") then
			FSM_LCD_WR		<= '1';
		end if;	
		if (KEY(15) = '1') then
			FSM_LCD_CLR		<= '1';
		end if;	
   end case;
end process output_logic;

end architecture behavioral;