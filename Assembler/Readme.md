# Здесь написаны переменные из Си-кода с их эквивалентными представлениями в Ассемблер-коде 

## __main__:
### int main(int argc, char *argv[])
* -4 = i в for 
* -8 = length
* -16 = FILE *input_stream
* -24 = FILE *output_stream
* -32 = t_start
* -40 = t_end
* -44 = answer
* -48 = length
* -308 = argc
* -320 = argv


## __lib__:
### int task(const char *str);
* -4 = sum
* -8 = i в for 
* -12 = length
* -13 = ch
* -24 = char *str

### int task_random(int length);
* -4 = j в for 
* -272 = string
* -276 = length

### int task_cmd();
* -256 = string
