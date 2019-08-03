import controlP5.*;

ControlP5 cp5;

boolean PicLoaded = false;
boolean Mirror = false;
boolean Animation = false;
boolean Collage = false;
boolean CollageFileTaken = false;
boolean Interactive = false;
boolean Static = false;
boolean Inverse = false;
boolean Ocean = false;
boolean Brightness = false;
boolean Restore = false;
boolean Remove = false;
boolean RemovePressed = false;
boolean Black_White = false;
boolean Sunny = false;
boolean Volcanic = false;
boolean Darkness = false;

int picWidth = 0;
int picHeight = 0;
int picStart;
int picEnd;


PImage img;
PImage collageImage;
PImage Cimg1, Cimg2, Cimg3, Cimg4, Cimg5, Cimg6, Cimg7, Cimg8, Cimg9;
PImage imageList[] = {null, Cimg1, Cimg2, Cimg3, Cimg4, Cimg5, Cimg6, Cimg7, Cimg8, Cimg9};
int sliderValue = 0;
int collageCount = 0;

void setup() 
{
  size(810, 580);
  background(185);
  //??
  textAlign(LEFT);
  textSize(16); 

  ////////////////////////////////////cp5 buttons//////////////////////////////////////////////

  cp5 = new ControlP5(this);

  cp5.addButton("Open")
    .setPosition(15, 35)
    .setSize(120, 40)
    ;

  cp5.addButton("Save")
    .setPosition(15, 80)
    .setSize(120, 40)
    ;

  cp5.addSlider("sliderValue")
    .setRange(2, 8)
    .setValue(4)
    .setPosition(645, 485)
    .setSize(160, 60)
    ;
}

void draw()
{

  background(29, 36, 48);
  //background(185);
  noStroke();
  int picStart = 0;
  int picEnd = 0;

  ////////////////////////////////////////////////////////////labels & lines//////////////////////////////////////////////////////////////

  stroke(0);
  fill(0);
  textSize(18);
  text("Manage Files", 20, 25);
  line(150, 0, 150, 130);
  //line(0, 130, 810, 130);
  line(0, 130, 640, 130);
  line(640, 80, 800, 80);
  text("Undo", 200, 25);
  text("Special Effects", 400, 25);
  fill(#186ff9);
  textSize(20);
  //text("20143408", 670, 50);
  text("PhotoShop", 670, 45);
  fill(0);
  line(300, 0, 300, 130);
  //line(450, 0, 450, 130);
  //text("Special Effects", 473, 25);
  line(640, 0, 640, 600);
  noStroke();

  stroke(0);
  fill(0);
  text("Filters", 690, 110);
  noStroke();

  //////////////////////////////////////////////////////////////////////buttons//////////////////////////////////////////////////////////////
  textSize(16);
  if (Mirror)
    fill(#186ff9);    
  else
    fill(16, 45, 91);
  rect(325, 35, 110, 40, 10);
  fill(255);
  text("Reverse<->", 335, 60);

  //animation
  if (Animation)
    fill(#186ff9);    
  else
    fill(16, 45, 91);
  rect(327, 80, 102, 40, 10);
  fill(255);
  text("Animation", 337, 105);


  //if (Remove)
  //  fill(#186ff9);    
  //else
  fill(16, 45, 91);
  rect(175, 35, 100, 40, 10);
  fill(255);
  text("Remove", 195, 60);


  //original image restore button

  if (Restore)
    fill(#186ff9);    
  else
    fill(16, 45, 91);
  rect(175, 80, 100, 40, 10);
  fill(255);
  text("Restore", 195, 105);



  if (Collage)
    fill(#186ff9);    
  else
    fill(16, 45, 91);
  rect(490, 35, 105, 40, 10);
  fill(255);
  text("Collage", 510, 60);

  if (Static)
    fill(#186ff9);    
  else
    fill(16, 45, 91);
  rect(490, 80, 100, 40, 10);
  fill(255);
  text("Static", 515, 105);

  if (Darkness)
    fill(#186ff9);     
  else
    fill(16, 45, 91); 
  rect(665, 120, 120, 40, 10);
  fill(255);
  text("Darkness", 690, 145);

  if (Black_White)
    fill(#186ff9);     
  else
    fill(16, 45, 91); 
  rect(665, 170, 120, 40, 10);
  fill(255);
  text("Black&White", 680, 195);

  if (Ocean)
    fill(#186ff9);    
  else
    fill(16, 45, 91);   
  rect(665, 220, 120, 40, 10);
  fill(255);
  text("Ocean", 705, 245);

  if (Sunny)
    fill(#186ff9);    
  else
    fill(16, 45, 91);   
  rect(665, 270, 120, 40, 10);
  fill(255);
  text("Sunny", 700, 295);

  if (Volcanic)
    fill(#186ff9);    
  else
    fill(16, 45, 91);   
  rect(665, 320, 120, 40, 10);
  fill(255);
  text("Volcanic", 695, 345);

  if (Inverse)
    fill(#186ff9);     
  else
    fill(16, 45, 91); 
  rect(665, 370, 120, 40, 10);
  fill(255);
  text("Inverse", 695, 395);


  if (Brightness)
    fill(#186ff9);    
  else
    fill(16, 45, 91);   
  rect(665, 420, 120, 40, 10);
  fill(255);
  text("Brightness", 685, 445);

  //////////////////////////////////////////////////////////////////////adjust image//////////////////////////////////////////////////////////////
  {
    noStroke();
    textSize(16);

    if (CollageFileTaken)
    {
      for (int i = 1; i<=collageCount; i++)
      {
        picWidth = imageList[i].width;
        picHeight = imageList[i].height;

        if (picWidth > 640)
        {
          picHeight = (int)(picHeight*(640.0/picWidth));
          picWidth = 640;
        }
        if (picHeight > 480)
        {
          picWidth = (int)(picWidth*(480.0/picHeight));
          picHeight = 480;
        }

        if (collageCount<4)
        {
          image(imageList[i], 0+(i-1)*picWidth/3, 131, picWidth/3, picHeight/3);
          loadPixels();
        }
        if (collageCount>3 && collageCount<7)
        {
          image(imageList[1], 0, 131, picWidth/3, picHeight/3);
          image(imageList[2], 0+picWidth/3, 131, picWidth/3, picHeight/3);
          image(imageList[3], 0+2*picWidth/3, 131, picWidth/3, picHeight/3);
          image(imageList[i], 0+(i-4)*picWidth/3, 131+picHeight/3, picWidth/3, picHeight/3);
          loadPixels();
        }
        if (collageCount>6 && collageCount<10)
        {
          image(imageList[1], 0, 131, picWidth/3, picHeight/3);
          image(imageList[2], 0+picWidth/3, 131, picWidth/3, picHeight/3);
          image(imageList[3], 0+2*picWidth/3, 131, picWidth/3, picHeight/3);
          image(imageList[4], 0, 131+picHeight/3, picWidth/3, picHeight/3);
          image(imageList[5], 0+picWidth/3, 131+picHeight/3, picWidth/3, picHeight/3);
          image(imageList[6], 0+2*picWidth/3, 131+picHeight/3, picWidth/3, picHeight/3);
          image(imageList[i], 0+(i-7)*picWidth/3, 131+picHeight*2/3, picWidth/3, picHeight/3);
          loadPixels();
        }
      }

      Collage = false;
    }

    if (PicLoaded)
    {     

      picWidth = img.width;
      picHeight = img.height;

      if (picWidth > 640)
      {
        picHeight = (int)(picHeight*(640.0/picWidth));
        picWidth = 640;
      }
      if (picHeight > 480)
      {
        picWidth = (int)(picWidth*(480.0/picHeight));
        picHeight = 480;
      }


      image(img, 0, 131, picWidth, picHeight);

      picStart = (width+1)*131;
      picEnd = picStart+width*picHeight;

      loadPixels();
    }


    //////////////////////////////////////////////////////////////////////Effects//////////////////////////////////////////////////////////////

    //horizontal reverse
    //  also create vertical reverse
    if (Mirror) //rename to something else
    {
      color tempColor;
      int row, left, right;
      left = 0;
      row = 131;

      while (row<picHeight+131) {
        right = left + picWidth - 1;
        while (left<right) {
          float r = red(pixels[left]);
          float g = green(pixels[left]);
          float b = blue(pixels[left]);
          tempColor = color(r, g, b);

          r = red(pixels[right]);
          g = green(pixels[right]);
          b = blue(pixels[right]);

          pixels[left] = color(r, g, b);
          pixels[right] = tempColor;
          right--;
          left++;
          if (left%width>=picWidth) {
            left=left+width-picWidth;
          }// end if
        }//end inner while
        row++;
        left=width*row;
      }//end outer while
    }
  }

  if (Remove)
  {
    if (CollageFileTaken)
    {
      CollageFileTaken = false; 
      updatePixels();
      redraw();
      RemovePressed = true;
    }
    int i = picStart;
    while (i < picEnd) 
    {
      pixels[i] = color(29, 36, 48);
      i += 1;
      if (i % width >= picWidth)        
        i = i + width - picWidth;
    }

    updatePixels();
    redraw();
    RemovePressed = true;
  }
  if (Restore) 
  {  
    Restore = !Restore;
    Mirror = false;
    Static = false;
    Inverse = false;
    Black_White = false;
    Ocean = false;
    Sunny = false;
    Brightness = false;
    Darkness = false;
    noTint();
    redraw();
  }

  if (Animation)
  {
    for (int x=0; x<width; x+=width)
      for (int y=0; y<height; y+=height) {
        tint(random(255), random(255), random(255));
        image(img, x, y+131, picWidth, picHeight);
      }
    delay(100);
  } 

  if (Black_White)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float a = (r+g+b)/3;
      pixels[i] = color(a, a, a);
      i += 1;
      if (i % width >= picWidth)        // This will ignore anything on the line that 
        i = i + width - picWidth;       // after the image (such as buttons)
    }
  } 

  if (Static)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      pixels[i] = color(random(0, red(c)), random(0, green(c)), random (0, blue(c)));
      i += 1;
      if (i % width >= picWidth)         
        i = i + width - picWidth;
    }
  }

  if (Inverse)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      pixels[i] = color(255-red(c), 255-green(c), 255-blue(c));
      i = i + 1;
      if (i % width >= picWidth)       
        i = i + width - picWidth;
    }
  }

  if (Sunny)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      pixels[i] = color(sliderValue*red(c), sliderValue*green(c), blue(c));
      i = i + 1;
      if (i % width >= picWidth)        
        i = i + width - picWidth;
    }
  }

  if (Ocean)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      pixels[i] = color(red(c), green(c), sliderValue*blue(c));
      i = i + 1;
      if (i % width >= picWidth)        
        i = i + width - picWidth;
    }
  }

  if (Volcanic)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      pixels[i] = color(sliderValue*red(c), green(c), blue(c));
      i = i + 1;
      if (i % width >= picWidth)        
        i = i + width - picWidth;
    }
  }

  if (Darkness)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      pixels[i] = color(red(c)/sliderValue, green(c)/sliderValue, blue(c)/sliderValue);
      i = i + 1;
      if (i % width >= picWidth)        // This will ignore anything on the line that 
        i = i + width - picWidth;       // after the image (such as buttons)
    }
  }

  if (Brightness)
  {
    int i = picStart;
    while (i < picEnd) 
    {
      color c = pixels[i];
      pixels[i] = color(red(c)*sliderValue, green(c)*sliderValue, blue(c)*sliderValue);
      i = i + 1;
      if (i % width >= picWidth)        
        i = i + width - picWidth;
    }
  }
  updatePixels(); 
  redraw();


  fill(255);
  noStroke();
}

void mouseClicked() {

  redraw();
}
//////////////////////////////////////////////////////////////////////Mouse Pressed//////////////////////////////////////////////////////////////
void mousePressed()
{

  if (mouseX>15 && mouseX<135 && mouseY>30 && mouseY<75)
  {
    Remove = false;
    RemovePressed = false;
    selectInput("Select a file to process:", "infileSelected");
  }

  if (mouseX>15 && mouseX<135 && mouseY>80 && mouseY<120)
  {
    selectOutput("Select a file to write to:", "outfileSelected");
  }

  //Collage
  if (mouseX>475 && mouseX<575 && mouseY>35 && mouseY<75)
  {
    Remove = !Remove;
    RemovePressed = !RemovePressed;
    PicLoaded = false;
    CollageFileTaken = false;
    Collage = true;

    selectInput("Select a file to process:", "infileSelected");
  }

  if (mouseX>325 && mouseX<435 && mouseY>35 && mouseY<75 && PicLoaded)
  {
    Mirror = !Mirror;
  }  
  //rect(325, 80, 100, 40, 10);
  if (mouseX>327 && mouseX<427 && mouseY>80 && mouseY<120 && PicLoaded)
  {
    Animation = !Animation;
  }  
  //rect(455, 80, 90, 40, 10);
  if (mouseX>455 && mouseX<545 && mouseY>80 && mouseY<120 && PicLoaded)
  {
    Interactive = !Interactive;
  } 
  //rect(175, 35, 100, 40, 10);
  if (mouseX>175 && mouseX<275 && mouseY>35 && mouseY<75 && RemovePressed == false)
  {
    Remove = !Remove;
  }  
  if (mouseX>175 && mouseX<275 && mouseY>80 && mouseY<120 && PicLoaded)
  {
    Restore = !Restore;
  }  
  //rect(475, 80, 100, 40, 10);
  //rect(490, 80, 100, 40, 10);
  if (mouseX>490 && mouseX<590 && mouseY>80 && mouseY<120 && PicLoaded)
  {
    Static = !Static;
  } 

  if (mouseX>665 && mouseX<785 && mouseY>120 && mouseY<160 && PicLoaded)
  {
    Darkness = !Darkness;
  } 

  if (mouseX>665 && mouseX<785 && mouseY>170 && mouseY<210 && PicLoaded)
  {
    Black_White = !Black_White;
  } 
  //rect(665, 370, 120, 40, 10);
  if (mouseX>665 && mouseX<785 && mouseY>370 && mouseY<410 && PicLoaded)
  {
    Inverse = !Inverse;
  }  
  //rect(665, 220, 120, 40, 10);

  if (mouseX>665 && mouseX<785 && mouseY>220 && mouseY<260 && PicLoaded)
  {
    Ocean = !Ocean;
  } 

  //rect(665, 270, 120, 40, 10);
  if (mouseX>665 && mouseX<785 && mouseY>270 && mouseY<310 && PicLoaded)
  {
    Sunny = !Sunny;
  } 

  //rect(665, 320, 120, 40, 10);
  if (mouseX>665 && mouseX<785 && mouseY>320 && mouseY<360 && PicLoaded)
  {
    Volcanic = !Volcanic;
  } 
  //rect(665, 420, 120, 40, 10);
  if (mouseX>665 && mouseX<785 && mouseY>420 && mouseY<460 && PicLoaded)
  {
    Brightness = !Brightness;
  } 
  redraw();
}

void infileSelected(File selection) 
{

  if (Collage)
  {
    if (collageCount>10)
    {
      Collage = false;
    } else {
      if (selection == null) 
      {
        println("IMAGE NOT LOADED: Window was closed or the user hit cancel.");
        Collage = false;
        //Remove = !Remove;
        //RemovePressed = !RemovePressed;
      } else
      {
        collageCount+=1;
        collageImage = loadImage(selection.getAbsolutePath());
        imageList[collageCount] = loadImage(selection.getAbsolutePath());
        CollageFileTaken = true;

        //interface function to show user how many photos he needs
      }
    }
  } else 
  {
    if (selection == null) 
    {
      println("IMAGE NOT LOADED: Window was closed or the user hit cancel.");
    } else 
    {
      println("IMAGE LOADED: User selected " + selection.getAbsolutePath());
      img = loadImage(selection.getAbsolutePath());
      PicLoaded = true;
      Mirror = false;
      Static = false;
      Inverse = false;
      Ocean = false;
      Brightness = false;
      redraw();
    }
  }
}

void outfileSelected(File selection) 
{
  if (selection == null) 
  {
    println("IMAGE NOT SAVED: Window was closed or the user hit cancel.");
  } else 
  {
    println("IMAGE SAVED: User selected " + selection.getAbsolutePath() + ".png");
    
    noLoop();
    updatePixels();                            
    redraw();
    PImage temp = get(0, 130, 640, 900);
    
    temp.save(selection.getAbsolutePath()+".png");
    redraw();
    loop();
  }
}
