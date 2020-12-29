float Circle(vec2 uv,vec2 p,float r,float blur)
{
    float d = length(uv - p);
    float c = smoothstep(r,r + blur,d);
    return 1. - c;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;

    uv -= .5;    
    uv.x *= iResolution.x / iResolution.y;


    vec3 color = vec3(0.);

    float mask = Circle(uv,vec2(0.),0.4,0.05);
    mask -= Circle(uv,vec2(-0.15,0.2),0.1,0.01);    
    mask -= Circle(uv,vec2( 0.15,0.2),0.1,0.01);    


    float mouth = Circle(uv,vec2(0.),0.3,0.02);
    mouth -= Circle(uv,vec2(0.,0.1),0.3,0.02);

    mask -= mouth;
    color = vec3(mask);
    color = vec3(1.,1.,0.) * mask;
    
    fragColor = vec4(color,1);

}
