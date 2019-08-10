program test;

uses sdl2, sdl2_image;

var
   win: PSDL_Window;
   ren: PSDL_Renderer;
   texture1: PSDL_Texture;
   rect: TSDL_Rect;

begin
  if SDL_Init(SDL_INIT_VIDEO) < 0 then
  begin
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Test', SDL_GetError, nil);
    HALT;
  end;

  win := SDL_CreateWindow('Test', 50, 50, 640, 480, SDL_WINDOW_SHOWN);
  if win = nil then
  begin
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Test', SDL_GetError, nil);
    HALT;
  end;

  ren := SDL_CreateRenderer(win, -1, 0);
  if ren = nil then
  begin
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Test', SDL_GetError, nil);
    HALT;
  end;

  texture1 := IMG_LoadTexture(ren, 'red.png');
  if texture1 = nil then
  begin
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Test', SDL_GetError, nil);
    HALT;
  end;

  rect.x := 10;
  rect.y := 20;
  rect.w := 180;
  rect.h := 160;

  SDL_RenderCopy(ren, texture1, @rect, nil);
  SDL_RenderCopy(ren, texture1, nil, @rect);

  SDL_RenderPresent(ren);
  SDL_Delay(2000);

  SDL_DestroyTexture(texture1);
  SDL_DestroyRenderer(ren);
  SDL_DestroyWindow(win);

  SDL_Quit;
end.

