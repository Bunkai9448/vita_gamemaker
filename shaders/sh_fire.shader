// source https://forum.yoyogames.com/index.php?threads/small-shader-problem.33940/

attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
//attribute vec4 in_Colour;                    // (r,g,b,a) unused in this shader.
//attribute vec2 in_TextureCoord;              // (u,v)     unused in this shader.

varying vec2 fragCoord;


void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
   
    fragCoord = in_Position.xy;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~// source https://forum.yoyogames.com/index.php?threads/small-shader-problem.33940/

uniform float iTime;
uniform vec2 iResolution;
varying vec2 fragCoord;

void main(){
    vec2 temp = vec2(fragCoord.x, iResolution.y - fragCoord.y);
    vec2 p = temp/iResolution.xy, a = p*5.; a.y -= iTime;
    vec2 f = fract(a); a -= f; f = f*f*(3.-2.*f);
    vec4 r = fract(sin(vec4(a.x + a.y*1e3) + vec4(0, 1, 1e3, 1001)) * 1e5)*30./p.y;
    gl_FragColor.rgb = vec3(2,.3,.2) * clamp(mix(mix(r.x, r.y, f.x), mix(r.z, r.w, f.x), f.y)-30., -.2, 1.);
    gl_FragColor.a = 0.5;
}
