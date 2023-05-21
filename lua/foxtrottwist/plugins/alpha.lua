local status, alpha = pcall(require, "alpha")
if not status then
	return
end

local dashboard_setup, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_setup then
	return
end

dashboard.section.header.val = {
	"                                                                                                                                             ",
	"          n@@@@@@@@@@@@@@@@@@@@@@@@@@@-                                                                                                      ",
	"          @@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                       ",
	"         <@@@@r-----------------f@@@@s                                                                                                       ",
	"         @@@@@                  )@@@@                                                                                                        ",
	"        ,@@@@;                  @@@@@                                                                                                        ",
	"        @@@@@                  ,@@@@;      fyk*v           >2k**_      -P*k1           P*VP           *ykP      fP*Vv           >yk**_       ",
	"        @@@@n                  @@@@@       @@@@]         :@@@@@@       @@@@V          4@@@@          L@@@@      @@@@]         :@@@@@@        ",
	"       c@@@@                   @@@@u      !@@@@         h@@@@@@@       @@@@           @@@@,          @@@@)     !@@@@         x@@@@@@@        ",
	"       @@@@@                  ?@@@@       @@@@o       r@@@d@@@@:      1@@@@          +@@@@          ,@@@@      @@@@*       r@@@@@@@@:        ",
	"      :@@@@:                  @@@@@       @@@@       @@@@,(@@@@       @@@@!          @@@@c          @@@@4      @@@@       @@@@,(@@@@         ",
	"      @@@@@                  :@@@@_      s@@@@     <@@@>  @@@@c      (@@@@          .@@@@           @@@@.     7@@@@     <@@@c  @@@@c         ",
	"      @@@@?                  @@@@@       @@@@'   .@@@@`  ,@@@@       @@@@n          @@@@@          >@@@@      @@@@'   ,@@@@'  ,@@@@          ",
	"     [@@@@                   @@@@?      '@@@@   u@@@+    @@@@@      '@@@@           @@@@-          @@@@)     '@@@@   u@@@+    @@@@@          ",
	"     @@@@@                  n@@@@       @@@@[ !@@@@      @@@@.      3@@@@          ]@@@@          :@@@@      @@@@[ !@@@@      @@@@.          ",
	"    _@@@@-                  @@@@@       @@@@!k@@@r      c@@@@       @@@@!          @@@@c          @@@@y      @@@@!P@@@r      ]@@@@           ",
	"    @@@@@                  ;@@@@-      F@@@@@@@o        @@@@L      L@@@@          -@@@@           @@@@`     F@@@@@@@2        @@@@+           ",
	"    @@@@]                  @@@@@       @@@@@@@!        -@@@@       @@@@Y          @@@@@          7@@@@      @@@@@@@_        -@@@@            ",
	"   x@@@@                   @@@@c      +@@@@@s          @@@@V      -@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@r     +@@@@@I          @@@@4            ",
	"   @@@@Y                  L@@@@       @@@@@-           @@@@`      n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@@@,           @@@@`            ",
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
	dashboard.button("m", "  > Marked", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
