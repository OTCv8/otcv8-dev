#ifndef OUTFITS_H
#define OUTFITS_H

static const std::string glslAdvancedOutfitVertexShader = "\n\
    attribute vec2 a_TexCoord;\n\
    attribute vec2 a_Vertex;\n\
    uniform mat3 u_TextureMatrix;\n\
    varying vec2 v_TexCoord;\n\
    varying vec2 v_TexCoord2;\n\
    varying vec2 v_TexCoord3;\n\
    uniform mat3 u_TransformMatrix;\n\
    uniform mat3 u_ProjectionMatrix;\n\
    uniform vec2 u_Offset;\n\
    uniform vec2 u_Resolution;\n\
    uniform float u_Depth;\n\
    void main()\n\
    {\n\
        gl_Position = vec4((u_ProjectionMatrix * u_TransformMatrix * vec3(a_Vertex.xy, 1.0)).xy, u_Depth / 16384.0, 1.0);\n\
        v_TexCoord = (u_TextureMatrix * vec3(a_TexCoord,1.0)).xy;\n\
        v_TexCoord2 = (u_TextureMatrix * vec3(a_TexCoord + u_Offset,1.0)).xy;\n\
        v_TexCoord3 = (u_TextureMatrix * vec3(u_Resolution,1.0)).xy;\n\
    }\n";

static const std::string glslAdvancedOutfitFragmentShader = "\n\
    uniform float u_Depth;\n\
    uniform mat4 u_Color;\n\
    varying vec2 v_TexCoord;\n\
    varying vec2 v_TexCoord2;\n\
    uniform sampler2D u_Tex0;\n\
    uniform sampler2D u_Tex1;\n\
    void main()\n\
    {\n\
        gl_FragColor = texture2D(u_Tex0, v_TexCoord);\n\
        if(texture2D(u_Tex0, v_TexCoord2).a > 0.01)\n\
            gl_FragColor *= vec4(1.0, 1.0, 0.0, 1.0);\n\
        if(gl_FragColor.a < 0.01) discard;\n\
    }\n";

#endif