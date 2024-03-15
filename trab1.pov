// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc" 
#include "shapes3.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 40      // front view
                            location  <0.0 ,3 ,-10>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 75   // diagonal view
                            location  <2.0 , 6 ,-2.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 130 // right side view
                            location  <3.0 , 2.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 6.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 4.0 ,7>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
                                                     
                      
                                                       
camera{Camera_0}
// sun ---------------------------------------------------------------------
//light_source{<0,100,-1000> White}
 
// sky ---------------------------------------------------------------
sky_sphere{ pigment{ gradient <0,1,0>
                     color_map{ [0   color rgb<0.24,0.34,0.56>*1.2*0.3]        
                                [0.5 color rgb<0.24,0.34,0.56>*0.5*0.3] 
                                [0.5 color rgb<0.24,0.34,0.56>*0.5*0.3] 
                                [1.0 color rgb<0.24,0.34,0.56>*1.2*0.3]          
                              }
                     
                      rotate< 0,0, 0>  
                   
                     scale 2 }
           } // end of sky_sphere
 
//------------------------------ the Axes --------------------------------
 
//------------------------------------------------------------------------
#macro Axis_( AxisLen, Dark_Texture,Light_Texture) 
 union{
    cylinder { <0,-AxisLen,0>,<0,AxisLen,0>,0.05
               texture{checker texture{Dark_Texture } 
                               texture{Light_Texture}
                       translate<0.1,0,0.1>}
             }
    cone{<0,AxisLen,0>,0.2,<0,AxisLen+0.7,0>,0
          texture{Dark_Texture}
         }
     } // end of union                   
#end // of macro "Axis()"
//------------------------------------------------------------------------
#macro AxisXYZ( AxisLenX, AxisLenY, AxisLenZ, Tex_Dark, Tex_Light)
//--------------------- drawing of 3 Axes --------------------------------
union{
#if (AxisLenX != 0)
 object { Axis_(AxisLenX, Tex_Dark, Tex_Light)   rotate< 0,0,-90>}// x-Axis
 text   { ttf "arial.ttf",  "x",  0.15,  0  texture{Tex_Dark} 
          scale 0.5 translate <AxisLenX+0.05,0.4,-0.10>}
#end // of #if 
#if (AxisLenY != 0)
 object { Axis_(AxisLenY, Tex_Dark, Tex_Light)   rotate< 0,0,  0>}// y-Axis
 text   { ttf "arial.ttf",  "y",  0.15,  0  texture{Tex_Dark}    
           scale 0.5 translate <-0.75,AxisLenY+0.50,-0.10>}
#end // of #if 
#if (AxisLenZ != 0)
 object { Axis_(AxisLenZ, Tex_Dark, Tex_Light)   rotate<90,0,  0>}// z-Axis
 text   { ttf "arial.ttf",  "z",  0.15,  0  texture{Tex_Dark}
               scale 0.5 translate <-0.75,0.2,AxisLenZ+0.10>}
#end // of #if 
} // end of union
#end// of macro "AxisXYZ( ... )"
//------------------------------------------------------------------------

#declare Texture_A_Dark  = texture {
                               pigment{ color rgb<1,0.45,0>}
                               finish { phong 1}
                             }
#declare Texture_A_Light = texture { 
                               pigment{ color rgb<1,1,1>}
                               finish { phong 1}
                             }

//object{ AxisXYZ( 4.5, 3.0, 5, Texture_A_Dark, Texture_A_Light) scale 0.25}
//-------------------------------------------------- end of coordinate axes


//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------



#declare knightCape = difference {


ovus{ 1.00, 0.65 // base_radius, top_radius  with: top_radius< base_radius!       
       
       texture{ pigment{ color rgb<0.12, 0.12, 0.24> }
                normal { pigment_pattern{ spiral2 5 sine_wave scale 2 rotate<90,0,0>
                                          color_map {[0, rgb 0.2]
                                                     [1, rgb 0.8]}
                                         }
                          1    
                        }
                 finish { phong 1  reflection{ 0.01 } }
               }  // end of texture ---------------------------------------------------  
 
      scale 0.5
      rotate<0,0,0>
      translate<0,0.5,0> 
}

//-------------------------------------------------------------------------
ovus{ 1.00, 0.65 // base_radius, top_radius  with: top_radius< base_radius! 
      texture{ pigment{ color rgb< 1.0, 0.9, 0.8>*0.9}  
            // normal { bumps 0.75 scale 0.02 }
               finish { phong 0.3 reflection { 0.00 metallic 0.00}  }
             } // end of texture 
      scale 0.49
      rotate<0,0,0>
      translate<0,0.5,0> 
    } // ------------------------------------------------------------------ 
//-------------------------------------------------------------------------


plane { <0,01,0>, 0  hollow // normal vector, distance to zero ----

        scale < 1, 1, 1>
        rotate< 0,0,0> rotate<0,0,0>
        translate<0,0.5,0>
      } // end of plane ------------------------------------------

object{//Round_Cone( point A, radius A, point B, radius B, rounding radius, merge on) 
         Round_Cone( <0,0,0>, 0.25    , <0,0.25,0>, 0 , 0, 0)  
         
        
         scale<1,1,1>  rotate<0,0,0> translate<0,0.5,-0.5>
       } // ----------------------------------------------------------- end Round_Cone 

       
}


#declare knightHead = union {

difference{
    object{ // Round_Box(A, B, WireRadius, UseMerge)
            Round_Box(<0,0,0>,<1,1,1>, 0.25   , 0)  
             
            texture{ pigment{ color rgb< 1, 1, 1> } //  color White
                       finish { phong 1 reflection 0.00}
                     } // end of texture 
    
            rotate<0, 0,0> translate<0,0,0>
          } // ---------------------------------------------------------
    
    sphere { <0,0,0>, 0.15 
    
              rotate<0,0,0>  translate<0.28,0.4,0>  
           }  // end of sphere ----------------------------------- 
    
    sphere { <0,0,0>, 0.15 
    
              rotate<0,0,0>  translate<0.72,0.4,0>  
           }
}

sphere_sweep{
    b_spline
    5,
    <-2,2,0>, .3
    <0,0,0>, .3
    <2,0,0>, .3
    <2,4,0>, .3
    <-2,2,0>, .3
    scale 0.2  
    translate<0.85,0.85,0.5>
     
    texture{ pigment{ color rgb< 1, 1, 1> } //  color White
    // normal { bumps 0.5 scale 0.05 }
       finish { phong 1 reflection 0.00}
     } // end of texture 

}

sphere_sweep{
    b_spline
    5,
    <-2,2,0>, .3
    <0,0,0>, .3
    <2,0,0>, .3
    <2,4,0>, .3
    <-2,2,0>, .3
    scale 0.2
    scale <-1, 1, 1>
   
    translate<0.2,0.85,0.5> 
    texture{ pigment{ color rgb< 1, 1, 1> } //  color White
    // normal { bumps 0.5 scale 0.05 }
       finish { phong 1 reflection 0.00}
     } // end of texture 

}

}


#declare knightBody = difference{ 
sphere { <0,0.5,0>, 1  
         scale<0.4,1,0.25> 

       }  // end of sphere -------------------------------------------------- 


object{ // Round_Box(A, B, WireRadius, UseMerge)
        Round_Box(<-1.00, 0.00, -1.00>,< 1.00, 4.00, 1.00>, 0.25   , 0)  
        scale <0.2,0.25,0.35>
        translate<0,-0.7,0>          
      } // ---------------------------------------------------------

}

#declare knightSword = union{
    cylinder { <0,0,0>,<0,2.00,0>, 0.30 
         texture { T_Grnt9
                   //normal { agate 0.15 scale 0.15}
                   finish { phong 0.5 } 
                   scale 1 
                 } // end of texture  
    

           scale <1,1,1> rotate<0,0,0> translate<0,-1,0>
         } // end of cylinder -------------------------------------
    cone { <0,0,0>,0.75,<0,5,0>,0 

         texture { T_Grnt9
                   //normal { agate 0.15 scale 0.15}
                   finish { phong 0.5 } 
                   scale 1 
                 } // end of texture 

       scale <1,1,1> rotate<0,0,0> translate<0,0,0>         
     } // end of cone -------------------------------------


}

#declare knight = union{ 
    object { knightHead translate <-0.5,1.5,-0.5> }
    object { knightCape scale <1,1.2,1>}
    object { knightBody scale 0.75 translate <0,0.4,0> }
    object { knightSword scale 0.25 rotate <0,0,225> translate <-0.3,1.3,0.5>}
    translate<0,-1,0>
}


#declare hornetDress = union{
    cone { <0,0,0>,1,<0,1.50,0>,0 

        texture{ pigment{ color rgb<1,0,0> }
                 normal { pigment_pattern{ radial 
                                           scallop_wave  frequency 15 
                                           scale  0.17  turbulence 0.0 
                                           color_map {[0, rgb 0.5]
                                                      [1, rgb 0.9]}
                                           rotate <90,0,90>
                                         }
                          1.5  
                        }
                 finish { phong 1 phong_size 20}
                 rotate<90,0,0>
               } // end of texture ---------------------------



       scale <1,1,1> rotate<0,0,0> translate<0,0,0>         
     } // end of cone -------------------------------------
     cone { <0,0,0>,1,<0,2,0>,0 

        texture{ pigment{ color rgb<1,0,0>} }

       scale 0.4 rotate<180,0,0> translate<0,1.5,0>         
     } // end of cone ------------------------------------- 
     
} 

#declare hornetHead = difference{
     
     sphere { <0,0.5,0>, 1  
         scale<0.4,1,0.25>

          texture{ pigment{ color rgb< 1, 1, 1> } //  color White
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
         

         rotate<30,0,0>  translate<0,1.8,0.1>  
       }  // end of sphere -------------------------------------------------- 


     sphere { <0,0.5,0>, 1  
         scale<0.25,1,0.3>

         rotate<30,0,0>  translate<0,2,0.2>  
       }  // end of sphere --------------------------------------------------
       
sphere { <0,0,0>, 1.25  
             scale<0.3,0.25,1> scale 0.12
             texture { pigment{ color rgb<0,0,0>}
                  
               } // end of texture
             rotate<90,0,50>  translate<-0.1,1.65,-0.15>  
           }  // end of sphere --------------------------------------------------  

    
sphere { <0,0,0>, 1.25  
             scale<0.3,0.25,1> scale 0.12
             texture { pigment{ color rgb<0,0,0>}
                  
               } // end of texture
             rotate<90,0,-50>  translate<0.1,1.65,-0.15>  
           }  // end of sphere -------------------------------------------------- 

    

   
       
       cutaway_textures
} 

 

#declare hornetLegs = union{

cone { <0,0,0>,0.1,<0,-2,0>,0 

       texture { pigment{ color rgb<0,0,0>}
                 finish { phong 1 reflection{ 0.00 metallic 0.00} } 
               } // end of texture

       scale <1,1,1> rotate<0,0,0> translate<-0.3,0,0>         

     } // end of cone -------------------------------------
cone { <0,0,0>,0.1,<0,-2,0>,0 

       texture { pigment{ color rgb<0,0,0>}
                 finish { phong 1 reflection{ 0.00 metallic 0.00} } 
               } // end of texture

       scale <1,1,1> rotate<0,0,0> translate<0.3,0,0>         
     } // end of cone -------------------------------------
     
} 


#declare hornetSword = union{

cylinder { <0,0,0>,<0,4.50,0>, 0.20 

         texture{ Chrome_Metal
                  // normal { bumps 0.5 scale 0.05 } 
                  // finish { phong 1 }
                } // end of texture ---------------------------  

           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder -------------------------------------

torus { 1.0,0.25  rotate<0,0,0>
         texture{ Chrome_Metal
                  // normal { bumps 0.5 scale 0.05 } 
                  // finish { phong 1 }
                } // end of texture ---------------------------
        scale 0.5 rotate<90,0,0> translate<0,-0.5,0>
      } // end of torus  -------------------------------              




object{ Supercone(<0.00,4.5,0.00>, 1, 0.2, // point A, axis Ax, axis Az, 
                  <0.00,15,0.00>, 0, 0) // point B, axis Bx, axis Bz) 
        texture{ Chrome_Metal
                  // normal { bumps 0.5 scale 0.05 } 
                  // finish { phong 1 }
                } // end of texture ---------------------------
        scale<1,1,1> 
        rotate<0,0,0> 
        translate<0,0,0>
      } // ----------------------------------------------------------------



     
}


#declare hornet = union{
object {hornetHead }
object {hornetDress }
object {hornetLegs }
object {hornetSword scale 0.2 rotate <260, 0, -40> translate <-0.8,0.05,0.25>}
}
  
  
  
#declare poste = union {

box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   

         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 


      scale <0.4,0.1,0.4> rotate<0,0,0> translate<0,0,0> 
    } // end of box --------------------------------------


cylinder { <0,0,0>,<0,6.00,0>, 0.15 

         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 

           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder -------------------------------------

cylinder { <0,6.00,0>,<0,7.5,0>, 0.11 

         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 

           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder -------------------------------------


cylinder { <0,7.5,0>,<0,8.5,0>, 0.07 

         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 

           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder -------------------------------------


torus { 0.4,0.3  rotate<0,0,0>
         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
        scale 0.2 rotate<0,0,0> translate<0,7.5,0>
      } // end of torus  -------------------------------              

torus { 0.5,0.4  rotate<0,0,0>
         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
        scale 0.2 rotate<0,0,0> translate<0,6.0,0>
      } // end of torus  -------------------------------

isosurface { //-------------------------------------------------------------
  function{
     f_spiral(
        x,y,z,
        0.25,  // distance between windings,
        0.05, // thickness,
        0.5,  // outer diameter of the spiral,
        0,    // not used,
        0,    // not used,
        0.75   // cross section type
     )
  }          
 contained_by {sphere {<0,0,0>,1}}
 threshold 0
 max_gradient 5
 
 texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
        
 rotate<90,0,-50>
 scale 1.25
 translate< -0.68,6.5,0>
} // end of isosurface -------------------------------------------------------
    
    
isosurface { //-------------------------------------------------------------
  function{
     f_spiral(
        x,y,z,
        0.25,  // distance between windings,
        0.05, // thickness,
        0.5,  // outer diameter of the spiral,
        0,    // not used,
        0,    // not used,
        0.75   // cross section type
     )
  }          
 contained_by {sphere {<0,0,0>,1}}
 threshold 0
 max_gradient 5
 
 texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
        
 rotate<-270,180,50>
 scale 1.25
 translate< 0.5,8.2,0>
} // end of isosurface ------------------------------------------------------- 
  
  
 

light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <-1.25,6.2,0>
  looks_like { sphere { 0*x, .1 pigment { White } 
                finish{ambient 4}
  } }
}

light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <1.1,8,0>
  looks_like { sphere { 0*x, .1 pigment { White } 
                finish{ambient 4}
  } }
}


} 


#declare benchSide = union {

sphere_sweep{
    b_spline
    7,
    <-5,1,0>, .5
    <-4,0,0>, .5
    <-3,1,0>, .5
    <-3,5,0>, .5
    <-3,9,0>, .5
    <-4,10,0>, .5
    <-5,9,0>, .5
        
   scale <0.25,0.5,0.25>
    translate <0,-2,0> 
texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
}


 
 
sphere_sweep{
    b_spline
    9,
    <-5,1,0>, .5
    <-4,0,0>, .5
    <-3,1,0>, .5
    <-3,5,0>, .5
    <0,6,0>, .5
    <3,5,0>, .5
    <3,1,0>, .5
    <4,0,0>, .5
    <5,1,0>, .5  
    
    scale <0.25,0.5,0.25>
    translate <0,-2,0> 
texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
}

}

#declare bench = union {

object{ benchSide rotate <0,90,0> translate <-3,0,0>}
object{ benchSide rotate <0,90,0> translate <3,0,0>}

cylinder { <-3,0.8,0>,<3,0.8,0>, 0.1
           texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder  ------------------------------------

cylinder { <-3,0.8,-0.5>,<3,0.8,-0.5>, 0.1
           texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder  ------------------------------------

cylinder { <-3,0.8,0.5>,<3,0.8,0.5>, 0.1
          texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder  ------------------------------------         

cylinder { <-3,2.7,0.75>,<3,2.7,0.75>, 0.1
           texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder  ------------------------------------

cylinder { <-3,0.8,0.75>,<3,0.8,0.75>, 0.1
           texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         } // end of cylinder  ------------------------------------
         

object{ Round_Conic_Torus( 1.00, // >0, vertical center distance of the upper and lower torii
                           0.80, // >0, upper radius up by <0,C_distance,0>
                           0.50, // >0,  lower radius on zero !!!
                           0.10, // border radius, // max. = min(lower radius, upper radius)
                           0 // Merge_On
                         ) // ------------------------------------------------  
         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
          scale .8  rotate<0,0,0>  translate<-2,1.2,0.8>
       }  // end of object ---------------------------------------------------

object{ Round_Conic_Torus( 1.00, // >0, vertical center distance of the upper and lower torii
                           0.80, // >0, upper radius up by <0,C_distance,0>
                           0.50, // >0,  lower radius on zero !!!
                           0.10, // border radius, // max. = min(lower radius, upper radius)
                           0 // Merge_On
                         ) // ------------------------------------------------  
         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
          scale .8  rotate<0,0,0>  translate<2,1.2,0.8>
       }  // end of object ---------------------------------------------------

object{ Round_Conic_Torus( 1.00, // >0, vertical center distance of the upper and lower torii
                           0.80, // >0, upper radius up by <0,C_distance,0>
                           0.50, // >0,  lower radius on zero !!!
                           0.10, // border radius, // max. = min(lower radius, upper radius)
                           0 // Merge_On
                         ) // ------------------------------------------------  
         texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
          scale .8  rotate<0,0,180>  translate<0,2.25,0.8>
       }  // end of object ---------------------------------------------------

         
}

   
#declare shopHouse = difference{

ovus{ 1.00, 0.65 // base_radius, top_radius  with: top_radius< base_radius! 
        texture{ pigment{ color rgb< 1, 1, 1>*0.15 }
                 normal { pigment_pattern{radial frequency 7 sine_wave
                                         color_map {[0.0, rgb 0]
                                                    [0.1, rgb 1]
                                                    [0.9, rgb 1]
                                                    [1.0, rgb 0]}
                                         rotate<90,45,0> scale 0.5} 1 }
                  finish { phong 1 phong_size 100  reflection{0.01} }
                } // end of texture ------------------------------------
 
      scale 2
      rotate<-45,-50,270>
      translate<0,0.5,0>
       
    }
 

    
ovus{ 1.00, 0.65 // base_radius, top_radius  with: top_radius< base_radius! 
      texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
      scale 1.8
      rotate<-45,-50,270>
      translate<0,0.5,0>
       
    }     

plane { <0,1,0>, 0  hollow // normal vector, distance to zero ----

       
        scale < 1, 1, 1>
        rotate< 0,0,0> rotate<0,0,0>
        translate<2,0.0,0>
      } // end of plane ------------------------------------------


ovus{ 1.00, 0.65 // base_radius, top_radius  with: top_radius< base_radius! 
      texture{ pigment{ color rgb< 1.0, 0.9, 0.8>*0.9}  
            // normal { bumps 0.75 scale 0.02 }
               finish { phong 0.3 reflection { 0.00 metallic 0.00}  }
             } // end of texture 
      scale 0.5
      rotate<0,0,0>
      translate<2,0.2,-1.5> 
    } 

  light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <1,1.5,-1>
  looks_like { sphere { 0*x, .1 pigment { White } 
                finish{ambient 4}
  } }   
  }

} 
 



#declare shopSigns = union{

 sphere { <0,0,0>, 0.5  
         scale<0.8,0.25,1>
         
       texture{ T_Stone6    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 
         rotate<90,-20,0>  translate<1,0.4,-2.3>  
       }  // end of sphere -------------------------------------------------- 

sphere { <0,0,0>, 0.25  
         scale<0.8,0.25,1>
         
       texture{ T_Stone6    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 
         rotate<90,-20,0>  translate<1.6,1.1,-2.3>  
       }  // end of sphere --------------------------------------------------

sphere { <0,0,0>, 0.15  
         scale<0.8,0.25,1>
         
       texture{ T_Stone6    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 
         rotate<90,-20,0>  translate<0.7,1.1,-2.3>  
       }  // end of sphere --------------------------------------------------        
 
sphere { <0,0,0>, 0.5  
         scale<0.8,0.25,1>
         
       texture{ T_Stone6    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 
         rotate<90,90,0>  translate<2.7,0.5,0-0.7>  
       }  // end of sphere --------------------------------------------------
       
sphere { <0,0,0>, 0.25  
         scale<0.8,0.25,1>
         
       texture{ T_Stone6    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 

         rotate<90,90,0>  translate<2.7,1.1,-0.2>  
       }  // end of sphere --------------------------------------------------

}


#declare shop = union{

object{ shopHouse }
object{ shopSigns }

}

      
box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   


    // tiling pattern in the xz plane  
    pigment{
           tiling 10 // 1~24 Pattern_Number
              color_map{
                [ 0.0 color rgb<1,1,1>*0.25]
                [ 0.5 color rgb<0.25,0.25,0.5>*0.5]
                [ 1.0 color rgb<1,1,1>*0]
                } // end color_map
           scale 0.005
           // rotate<-90,0,0> // align to xy plane
        } // end pigment
 

      scale <100,0.1,100> rotate<0,0,0> translate<0,0,0> 
} // end of box --------------------------------------

 
fog{ fog_type   2
     distance   20
     color rgb<0.24,0.34,0.56>*1.2 
     fog_offset 0.1
     fog_alt    1.5
     turbulence 1.8
   } //---------------- 
 
//---------------------------------------------------------------------
height_field{ png "Mount1.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-0.0,-0.5>
              scale<50,7,50>*1 
              texture{ pigment { rgb<0.24,0.34,0.56>*1.2*0.1}
                       normal  { bumps 0.75 scale 0.025  }
                     } // end of texture
              rotate<0, 0,0>
              translate<2,0,25>
            } // end of height_field ----------------------------------
//---------------------------------------------------------------------
 
  

object{bench translate <0,3,0> scale 0.2}
object{poste scale 0.35 translate <-1,0.2,-1>}  
object{knight scale 0.40  translate <1,0.6,0>}
object{hornet scale 0.35 translate <2,0.8,1>}
object{shop rotate<0,20,0> translate <-5,0,5>}
 

   
     
   

