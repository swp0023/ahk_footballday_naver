
Gui, Add, Text, x30 y5 w110 h20, ��ũ�� ���α׷� 
Gui, Add, Text, x60 y25 w50 h20 vA, �غ�!!! 
;Gui, Add, Text, x60 y50 h20 w50 vB, 0 ȸ

Gui, add, text, x40 y60 w110 h20, ģ����� �ڵ�
Gui, add, text, x20 y84 w30 h20, PW :
Gui, add, edit, x60 y80 w70 h20 vPW, wder
; gui, add, edit, �ɼ�, �ʱ� ��
; edit�� ���α׷� ����ڷκ��� �ؽ�Ʈ�� �Է¹޴´�.
; gui ������ �ڵ常���� �ϸ� ����. gui creater�� �������.

Gui, Add, Button, x20 y140 w110 h20, ���� 
Gui, Add, Button, x20 y170 w110 h20, ���� 
Gui, Add, Text, x50 y200 w90 h20 vC, F2 : ����
Gui, Show 

; gui, add, checkbox, x0 y0 w0 h0 v2���̹���Ŭ��, 2���̹���Ŭ��
; üũ�ڽ� gui
; üũ�ϸ� 1�� ��, üũ���� ������ 0�� ��
; gui, add, checkbox, x0 y0 w0 h0 v2���̹���Ŭ�� checked, 2���̹���Ŭ��
; checked �� ��� üũ �� ���·� ����.

; gui, add, combobox, �ɼ�, �׸�1|�׸�2|�׸�3
; ���ö�
; ex) gui, add, combobox, x0 y0 w0 h0 vŬ������ choose1, 1��|2��|3��
; ���Ŀ� ������ ���ÿ��� (Ŭ������ = "1��")�� ����


global ��ũ�ν��� := false
; ��ư�� ��Ű�� ����Ҷ��� global�� �ʿ������,
; �Լ��� ����Ҷ��� global�� �־��־�� �Ѵ�.
; global�� ������ ��𼭵� ��밡��

CoordMode, pixel, screen
CoordMode, mouse, screen

return 

button����: 
{ 
    Gui, submit, nohide
    GuiControl, , A, ����
    ; submit �� ������Ʈ�ϰ� �����ϸ� ��.
    
    ��ũ�ν��� := true 
    ; while(����)
    ; ���� �Ͽ��� loop�� ���.
    while(��ũ�ν���=true)
    {
		; ���� ������ �����ϴ�.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\game_start3.bmp
        foundx:=foundx+50
        foundy:=foundy+50
        Send {Click %foundx% %foundy%} 
        Sleep, 6000 
        
        ; ���۹�ư�� ������ ������ �޽��� ���.
        if errorlevel=1
        {
            MsgBox, game start ��ư�� ã�� ���߽��ϴ�.
            break
        }
        
        ; �⼮ Ȯ�� ��ư�� �����ϴ�.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 3000
        ;errorlevel := 0
        
        errorlevel := 1
        ; ��� ���� ��� ȭ������ ���⸦ �����ϴ�.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\go_game.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 3000 
        
        if (errorlevel=0)
        {
            loop, 15
            {
                ; ��� ���� ����� �����ϴ�.
                ; &&�� �̿��Ͽ� and ����
                ; ||�� �Է��ϸ� or ����
                if ((errorlevel=0) && (��ũ�ν��� = true))
                {
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\result.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; ������� ����� ������ ������ ���, Ȯ���� �����ϴ�.
                    if errorlevel = 1
                    {
                        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check2.bmp
                        Send {Click %foundx% %foundy%} 
                        Sleep, 500
                    }
                }
            }                
        }
        
        ; index�� ���⸦ �����ϴ�.
        index() 
        Sleep, 2000
        
        errorlevel:=1
        ; ��� ���� ��� ȭ������ ���⸦ �����ϴ�.
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\go_game.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 2000
        
        if (errorlevel=1)
        {
            loop, 15
            {
                ; ��� ���� ����� �����ϴ�.
                if ((errorlevel=0) && (��ũ�ν��� = true))
                {
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\result.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; ������� ����� ������ ������ ���, Ȯ���� �����ϴ�.
                    if errorlevel = 1
                    {
                        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check2.bmp
                        Send {Click %foundx% %foundy%} 
                        Sleep, 500
                    }
                }        
            }
        }
        
        ; index�� ���⸦ �����ϴ�.
        index()
        Sleep, 2000
        
        ; ���� ģ�� ���� ������ �ִ��� �켱 Ȯ���մϴ�.
        errorlevel:=1
        ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy.bmp
        Send {Click %foundx% %foundy%} 
        Sleep, 1000
        
        ; ���� ģ���� ��⸦ �����մϴ�.
        if errorlevel=0
        {
            loop, 30
            {
                if ((errorlevel=0) && (��ũ�ν��� = true))
                {
                    ; ���� ����
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 1000
                
                    ; ��� Ȯ��
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy_check.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                }
            }
        }
        
        if (PW!=wder)
        {
            MsgBox, ģ����� �ڵ尡 �ùٸ��� �ʽ��ϴ�.
        }
        
        
        ; ģ����� ��й�ȣ�� wder�̸� �����մϴ�.
        while (PW=wder)
        {
        ; ģ����� ����-(��Ŭ��-�����ϱ�-����ޱ�-������Ȯ��)
            ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\match.bmp
            Send {Click %foundx% %foundy%} 
            Sleep, 500
        
            Loop, 5
            {
                errorlevel:=1
                ; �� ����
                ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\team_select.bmp
                Send {Click %foundx% %foundy%} 
                Sleep, 500
            
                if ((errorlevel=0) && (��ũ�ν��� = true))
                {
                    ; �����ϱ� ����
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\challengy2.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; �����ϱ� Ȯ�� ����
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check3.bmp
                    Send {Click %foundx% %foundy%} 
                    ; ��� ������� 10�� ���
                    Sleep, 600000
                
                    ; ����ޱ�
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\reward.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                    ; ������Ȯ��
                    ImageSearch, foundx, foundy, 0, 0, a_screenwidth, A_ScreenHeight, *50 %A_ScriptDir%\image\check4.bmp
                    Send {Click %foundx% %foundy%} 
                    Sleep, 500
                
                }
            }
        }
        
        ; index�� ���⸦ �����ϴ�.
        index()
        Sleep, 2000
        
        if(��ũ�ν��� := false) 
        { 
            break 
        }
    } 
} 
return 	

button����:	
{ 
    ��ũ�ν��� := false 
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
    ��ũ�ν��� := false
    
    Gui, submit,nohide
    GuiControl, , A, ����
}
; f2Ű�� ���ߴ� ����Ű ���
; gui�� A�� ���� ���� ǥ��
