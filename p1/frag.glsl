
float mysmoothstep(float t1, float t2, float x) {
  x = clamp((x - t1) / (t2 - t1), 0.0, 1.0); 
  return x * x * (3. - 2. * x);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
    uv -= .5;
    uv.x *= iResolution.x / iResolution.y;
    float d = length(uv);
    float r = 0.3;

    //float c = mysmoothstep(r,r + 0.1,d);
    float c = smoothstep(r,r + 0.1,d);
    fragColor = vec4(vec3(c),1.0);
}

