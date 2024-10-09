log_file = open("logs/logs.dat", "r")

instr_counter = dict()
comb2_counter = dict()
comb3_counter = dict()
comb4_counter = dict()
comb5_counter = dict()
pre4instr = ""
pre3instr = ""
pre2instr = ""
preinstr = ""
instr = ""

for line in log_file:
        pre4instr = pre3instr
        pre3instr = pre2instr
        pre2instr = preinstr
        preinstr = instr
        instr = line.strip()

        if instr in instr_counter.keys():
                instr_counter[instr] += 1
        else:
                instr_counter[instr] = 1

        if preinstr != "":
                comb = preinstr + ' -> ' + instr
                if comb in comb2_counter.keys():
                        comb2_counter[comb] += 1
                else:
                        comb2_counter[comb] = 1

        if "" not in (preinstr, pre2instr):
                comb = pre2instr + ' -> ' + preinstr + ' -> ' + instr
                if comb in comb3_counter.keys():
                        comb3_counter[comb] += 1
                else:
                        comb3_counter[comb] = 1

        if "" not in (preinstr, pre2instr, pre3instr):
                comb = pre3instr + ' -> ' + pre2instr + ' -> ' + preinstr + ' -> ' + instr
                if comb in comb4_counter.keys():
                        comb4_counter[comb] += 1
                else:
                        comb4_counter[comb] = 1

        if "" not  in (preinstr, pre2instr, pre3instr, pre4instr):
                comb = pre4instr + ' -> ' + pre3instr + ' -> ' + pre2instr + ' -> ' + preinstr + ' -> ' + instr
                if comb in comb5_counter.keys():
                        comb5_counter[comb] += 1
                else:
                        comb5_counter[comb] = 1
                
log_file.close()

instr_total = sum(instr_counter.values())
comb2_total = instr_total - 1
comb3_total = instr_total - 2
comb4_total = instr_total - 3
comb5_total = instr_total - 4

for instr in instr_counter.keys():
        print(instr + " : " + str(instr_counter[instr])) 
print("\n")
for comb in comb2_counter.keys():
        print(comb + " : " + str(comb2_counter[comb])) 
print("\n")
for comb in comb3_counter.keys():
        print(comb + " : " + str(comb3_counter[comb])) 
print("\n")
for comb in comb4_counter.keys():
        print(comb + " : " + str(comb4_counter[comb])) 
print("\n")
for comb in comb5_counter.keys():
        print(comb + " : " + str(comb5_counter[comb])) 