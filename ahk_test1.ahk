
Gui, Add, Text, x30 y5 w110 h20, 매크로 프로그램 
Gui, Add, Text, x60 y25 w50 h20 vA, 준비!!! 
;Gui, Add, Text, x60 y50 h20 w50 vB, 0 회

Gui, add, text, x40 y60 w110 h20, 친선경기 코드
Gui, add, text, x20 y84 w30 h20, PW :
Gui, add, edit, x60 y80 w70 h20 vPW, wder
; gui, add, edit, 옵션, 초기 값
; edit는 프로그램 사용자로부터 텍스트를 입력받는다.
; gui 구성은 코드만으로 하면 복잡. gui creater를 사용하자.

Gui, Add, Button, x20 y140 w110 h20, 시작 
Gui, Add, Button, x20 y170 w110 h20, 종료 
Gui, Add, Text, x50 y200 w90 h20 vC, F2 : 정지
Gui, Show 

; gui, add, checkbox, x0 y0 w0 h0 v2번이미지클릭, 2번이미지클릭
; 체크박스 gui
; 체크하면 1의 값, 체크하지 않으면 0의 값
; gui, add, checkbox, x0 y0 w0 h0 v2번이미지클릭 checked, 2번이미지클릭
; checked 일 경우 체크 된 상태로 시작.

; gui, add, combobox, 옵션, 항목1|항목2|항목3
; 선택란
; ex) gui, add, combobox, x0 y0 w0 h0 v클릭안함 choose1, 1번|2번|3번
; 이후에 조건을 사용시에는 (클릭안함 = "1번")의 형태


global 매크로시작 := false
; 버튼과 핫키로 사용할때는 global이 필요없으나,
; 함수를 사용할때는 global을 넣어주어야 한다.
; global을 넣으면 어디서든 사용가능

CoordMode, pixel, screen
CoordMode, mouse, screen

return 

button시작: 
{ 
    Gui, submit, nohide
    GuiControl, , A, 시작
    ; submit 는 업데이트하고 생각하면 됨.
    
    매크로시작 := true 
    ; while(조건)
    ; 조건 하에서 loop를 사용.
    while(매크로시작=true)
    {
		; 게임 시작을 누릅니다.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\game_start3.bmp
        foundx:=foundx+50
        foundy:=foundy+50
        Send {Click %foundx% %foundy%} 
        Sleep, 6000 
        
        ; 시작버튼이 보이지 않으면 메시지 출력.
        if errorlevel=1
        {
            MsgBox, game start 버튼을 찾지 못했습니다.
            break
        }
        
        ; 출석 확인 버튼을 누릅니다.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 3000
        ;errorlevel := 0
        
        errorlevel := 1
        ; 경기 진행 결과 화면으로 가기를 누릅니다.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\go_game.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 3000 
        
        if (errorlevel=0)
        {
            loop, 15
            {
                ; 경기 진행 결과를 누릅니다.
                ; &&을 이용하여 and 조건
                ; ||을 입력하면 or 조건
                if ((errorlevel=0) && (매크로시작 = true))
                {
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\result.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; 순서대로 결과를 누르지 못했을 경우, 확인을 누릅니다.
                    if errorlevel = 1
                    {
                        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check2.bmp
                        Send {Click %foundx% %foundy%} 
                        Sleep, 500
                    }
                }
            }                
        }
        
        ; index로 가기를 누릅니다.
        index() 
        Sleep, 2000
        
        errorlevel:=1
        ; 경기 진행 결과 화면으로 가기를 누릅니다.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\go_game.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 2000
        
        if (errorlevel=1)
        {
            loop, 15
            {
                ; 경기 진행 결과를 누릅니다.
                if ((errorlevel=0) && (매크로시작 = true))
                {
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\result.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; 순서대로 결과를 누르지 못했을 경우, 확인을 누릅니다.
                    if errorlevel = 1
                    {
                        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check2.bmp
                        Send {Click %foundx% %foundy%} 
                        Sleep, 500
                    }
                }        
            }
        }
        
        ; index로 가기를 누릅니다.
        index()
        Sleep, 2000
        
        ; 게임 친구 도전 선택이 있는지 우선 확인합니다.
        errorlevel:=1
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 1000
        
        ; 게임 친구와 경기를 시작합니다.
        if errorlevel=0
        {
            loop, 30
            {
                if ((errorlevel=0) && (매크로시작 = true))
                {
                    ; 도전 선택
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 1000
                
                    ; 결과 확인
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy_check.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                }
            }
        }
        
        if (PW!=wder)
        {
            MsgBox, 친선경기 코드가 올바르지 않습니다.
        }
        
        
        ; 친선경기 비밀번호가 wder이면 진행합니다.
        while (PW=wder)
        {
        ; 친선경기 입장-(팀클릭-도전하기-보상받기-아이템확인)
            ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\match.bmp
            Send {Click %foundx% %foundy%} 
            Sleep, 500
        
            Loop, 5
            {
                errorlevel:=1
                ; 팀 선택
                ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\team_select.bmp
                Send {Click %foundx% %foundy%} 
                Sleep, 500
            
                if ((errorlevel=0) && (매크로시작 = true))
                {
                    ; 도전하기 선택
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy2.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; 도전하기 확인 선택
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check3.bmp
                    Send {Click %foundx% %foundy%} 
                    ; 경기 종료까지 10분 대기
                    Sleep, 600000
                
                    ; 보상받기
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\reward.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; 아이템확인
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check4.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                }
            }
        }
        
        ; index로 가기를 누릅니다.
        index()
        Sleep, 2000
        
        if(매크로시작 := false) 
        { 
            break 
        }
    } 
} 
return 	

button종료:	
{ 
    매크로시작 := false 
    ExitApp  
} 
return

index()
{
    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\index.bmp
    Send {Click %foundx% %foundy%}
}

F2::
{
    매크로시작 := false
    
    Gui, submit,nohide
    GuiControl, , A, 멈춤
}
; f2키로 멈추는 단축키 기능
; gui의 A에 멈춤 문구 표시
