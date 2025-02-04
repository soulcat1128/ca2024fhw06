xof 0303txt 0032
template Vector {
 <3d82ab5e-62da-11cf-ab39-0020af71e433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template MeshFace {
 <3d82ab5f-62da-11cf-ab39-0020af71e433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
 <3d82ab44-62da-11cf-ab39-0020af71e433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

template MeshNormals {
 <f6f23f43-7686-11cf-8f52-0040333594a3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template Coords2d {
 <f6f23f44-7686-11cf-8f52-0040333594a3>
 FLOAT u;
 FLOAT v;
}

template MeshTextureCoords {
 <f6f23f40-7686-11cf-8f52-0040333594a3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template ColorRGBA {
 <35ff44e0-6c7c-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <d3e16e81-7835-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template Material {
 <3d82ab4d-62da-11cf-ab39-0020af71e433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshMaterialList {
 <f6f23f42-7686-11cf-8f52-0040333594a3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material <3d82ab4d-62da-11cf-ab39-0020af71e433>]
}

template TextureFilename {
 <a42790e1-7810-11cf-8f52-0040333594a3>
 STRING filename;
}


Mesh {
 19;
 2.088253;1.361211;-1.211908;,
 2.079257;1.331927;-1.218056;,
 1.897070;0.025834;-1.112871;,
 2.184183;1.483659;-1.085197;,
 2.160897;1.470681;-1.121351;,
 2.136652;1.449050;-1.156375;,
 2.115319;1.418964;-1.183633;,
 2.099588;1.388029;-1.200915;,
 2.287681;1.361211;-0.866488;,
 2.288508;1.331927;-0.855623;,
 2.106321;0.025834;-0.750437;,
 2.205762;1.488778;-1.049472;,
 2.225912;1.483659;-1.012921;,
 2.245578;1.470681;-0.974678;,
 2.263788;1.449050;-0.936169;,
 2.276728;1.418964;-0.904065;,
 2.001695;0.025834;-0.931654;,
 2.283828;1.388029;-0.881801;,
 2.183882;1.331927;-1.036840;;
 18;
 3;2,16,1;,
 3;7,18,6;,
 3;0,18,7;,
 3;1,18,0;,
 3;11,3,18;,
 3;18,3,4;,
 3;5,18,4;,
 3;6,18,5;,
 3;18,16,9;,
 3;18,17,15;,
 3;18,8,17;,
 3;18,9,8;,
 3;12,11,18;,
 3;12,18,13;,
 3;18,14,13;,
 3;18,15,14;,
 3;16,18,1;,
 3;16,10,9;;

 MeshNormals {
  19;
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159020;0.493638;,
  -0.855006;0.159020;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159020;0.493638;,
  -0.855006;0.159020;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159020;0.493638;,
  -0.855006;0.159019;0.493638;,
  -0.855006;0.159019;0.493638;;
  18;
  3;2,16,1;,
  3;7,18,6;,
  3;0,18,7;,
  3;1,18,0;,
  3;11,3,18;,
  3;18,3,4;,
  3;5,18,4;,
  3;6,18,5;,
  3;18,16,9;,
  3;18,17,15;,
  3;18,8,17;,
  3;18,9,8;,
  3;12,11,18;,
  3;12,18,13;,
  3;18,14,13;,
  3;18,15,14;,
  3;16,18,1;,
  3;16,10,9;;
 }

 MeshTextureCoords {
  19;
  0.906462;0.900717;,
  0.892393;0.896058;,
  0.264927;0.896058;,
  0.965287;0.975514;,
  0.959052;0.955142;,
  0.948660;0.935005;,
  0.934207;0.918750;,
  0.919345;0.907921;,
  0.906462;0.900717;,
  0.892393;0.896058;,
  0.264927;0.896058;,
  0.967746;0.995306;,
  0.965287;0.975514;,
  0.959052;0.955142;,
  0.948660;0.935005;,
  0.934207;0.918750;,
  0.264927;0.995306;,
  0.919345;0.907921;,
  0.892393;0.995306;;
 }

 MeshMaterialList {
  1;
  18;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.500000;0.500000;0.500000;;

   TextureFilename {
    "Tex\\\\dresser.png*Spa\\\\koutaku_s.png";
   }
  }
 }
}