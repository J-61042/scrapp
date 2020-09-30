neg = true
scale = 1
hours = 0
minutes = 424242
seconds = 48
if not neg then
    time = ((hours*60^2)+(minutes*60)+seconds)
else
    time = ((hours*60^2)-(minutes*60)-seconds-4294967296) -- Last number is the FF FF FF FF to reset all the way around.
end

equ = scale*time
print(equ)
ans = equ
hex = string.format("%x",ans)
print(hex:upper())
print(hex:len()/2)
