function processed = M2DBatchCokeQuanti( start, final, multi )

for i = start:final
    sumM2DFile(['K',num2str(i),'.asc'],multi);
    propertyeditor('on');
end

M2DCokeQuanti(start, final, multi);