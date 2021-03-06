% BME 260 Spring 2017
% Modeling Blood Flow in Healthy and Anemic Physiology
% Mixing function to incorporate all blood components before sending back.

function b = mix(bHeart, bMus, bKid, bBone, bInt, bElse)

dist = bHeart.dist;

bHeart.concO2  = bHeart.o2 .* dist(1) + bMus.o2 .* dist(2) + ...
          bKid.o2 .* dist(3) + bBone.o2 .* dist(4) + ...
          bInt.o2 .* dist(5) + bElse.o2 .* dist(6);
      
bHeart.concGlu = bHeart.glu .* dist(1) + bMus.glu .* dist(2) + ...
          bKid.glu .* dist(3) + bBone.glu .* dist(4) + ...
          bInt.glu .* dist(5) + bElse.glu .* dist(6);

bHeart.concCO2 = bHeart.co2 .* dist(1) + bMus.co2 .* dist(2) + ...
          bKid.co2 .* dist(3) + bBone.co2 .* dist(4) + ...
          bInt.co2 .* dist(5) + bElse.co2 .* dist(6);

bHeart.concH2O = bHeart.h2o .* dist(1) + bMus.h2o .* dist(2) + ...
          bKid.h2o .* dist(3) + bBone.h2o .* dist(4) + ...
          bInt.h2o .* dist(5) + bElse.h2o .* dist(6);
      
bHeart.ions    = bHeart.ions .* dist(1) + bMus.ions .* dist(2) + ...
          bKid.ions .* .20726 + bBone.ions .* dist(4) + ...
          bInt.ions .* dist(5) + bElse.ions .* dist(6);

bHeart.oxNeed = ...
    mean([bHeart.oxNeed,bMus.oxNeed,bKid.oxNeed,bBone.oxNeed,bInt.oxNeed]);    

if bHeart.i > 10
bHeart.baseheartO2 = bHeart.baseO2;
bHeart.baseintO2   = bInt.baseO2;
bHeart.basemusO2   = bMus.baseO2;
bHeart.baseboneO2  = bBone.baseO2;
bHeart.baseelseO2  = bElse.baseO2;
bHeart.basekidO2   = bKid.baseO2;
end

if bHeart.i > 20
end

b = bHeart;
b.hemo = bBone.hemo;
end