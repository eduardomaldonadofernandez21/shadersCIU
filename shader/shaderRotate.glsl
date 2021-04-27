#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),sin(_angle),
                sin(_angle),-cos(_angle));
}

void main(){
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  st.x *= u_resolution.x/u_resolution.y;
  vec3 color = vec3(0.0);
  float d = 0.0;

  st = st *2.-1.;
    
  st = rotate2d( sin(u_time)*PI ) * st;

  float a = atan(st.x,st.y)+PI;
  float r = TWO_PI/float(32);
  
  d = cos(floor(.5+a/r)*r-a)*(length(st)+mod(a,r));
    
  color = vec3(1.0-smoothstep(1.400,0.282,d));
  
  gl_FragColor = vec4(color,1.544);
}