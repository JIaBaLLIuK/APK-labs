#include <iostream>
#include <Windows.h>

using namespace std;

int main()
{
    HANDLE COM_Port_3 = CreateFile(L"COM3", GENERIC_WRITE, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    HANDLE COM_Port_4= CreateFile(L"COM4", GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if (COM_Port_3 == INVALID_HANDLE_VALUE)
    {
		cout << "Error has occured!" << endl;
		return -1;
    }

    char data = 'h';
    DWORD data_size = sizeof(data);
    DWORD written_size;
    WriteFile(COM_Port_3, &data, data_size, &written_size, nullptr);
	cout << "Data size: " << data_size << ". Size of written data: " << written_size << "." << endl;
    char received_data;
	data_size = 0;

    if (ReadFile(COM_Port_4, &received_data, 1, &data_size, 0))
    {
        cout << "Received data: '" << received_data << "'. Size of received data: " << data_size << "." << endl;
    }

    CloseHandle(COM_Port_3);
    CloseHandle(COM_Port_4);

	return 0;
}