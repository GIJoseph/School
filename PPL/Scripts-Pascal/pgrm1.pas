program hello;
var
	amount,years:integer;
	interestRate:real;
function pow(x,y:integer): integer;
	var result,i:integer;
	begin
		result := 1;
		for i:=1 to y do
		begin
			result := result * x;
		end;
		pow := result;
	end;
begin
{
	writeln('please type in the value for the amount');
	Readln(amount);
	writeln('please type in your interest rate 1.00 = 100%');
	Readln(interestRate);
	writeln('please type in how many years');
	Readln(years);
}
	writeln(pow(2,8));
end.