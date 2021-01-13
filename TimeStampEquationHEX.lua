neg = true
if neg then scale = 1 else scale = 1000 end --[[added if statement because you only need two.]]--If you want to use neg change scale to 1 for it to loop around properly. hhh
hours = 0
minutes = 34
seconds = 00
if not neg then
    time = ((hours*60^2)+(minutes*60)+seconds)print(time)
else
    time = (4294967296-(hours*60^2)-(minutes*60)-seconds)print(time) -- Last number is the FF FF FF FF to reset all the way around.
end
equ = scale*time
print(equ)
hex = string.format("%x",equ)
print(string.format("%x",scale):upper())
print(hex:upper())
print(hex:len()/2)
