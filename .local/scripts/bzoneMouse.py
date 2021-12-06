#!/usr/bin/env python3
from pynput import mouse, keyboard
from pynput.keyboard import Key
import time
Kcontroller = keyboard.Controller()


def on_click(x,y,button, pressed):
    if str(button) == 'Button.button9' and pressed:
        print("9")
        Kcontroller.press(Key.f10)
        Kcontroller.press(Key.ctrl_l)
    if str(button) == 'Button.button9' and pressed==False:
        Kcontroller.release(Key.f10)
        Kcontroller.release(Key.ctrl_l)

    if str(button) == 'Button.button8' and pressed:
        print("8")
        Kcontroller.press(Key.ctrl_l)
        Kcontroller.press(Key.f11)
    if str(button) == 'Button.button8' and pressed==False:
        print('8')
        Kcontroller.release(Key.f11)
        Kcontroller.release(Key.ctrl_l)

def on_scroll(x, y, dx, dy):
    if dy<0:
        Kcontroller.press('3')
        Kcontroller.release('3')
        time.sleep(0.01)
        Kcontroller.press('1')
        Kcontroller.release('1')
        print('Rueda abajo')
with mouse.Listener(on_click=on_click) as listener:
    listener.join()


