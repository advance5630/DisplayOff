using System.Runtime.InteropServices;

internal static class Program
{
    private const int HwndBroadcast = 0xffff;
    private const int WmSyscommand = 0x0112;
    private const int ScMonitorpower = 0xf170;
    private const int MonitorOff = 2;
    private const uint SmtoAbortifhung = 0x0002;

    [DllImport("user32.dll", SetLastError = true)]
    private static extern IntPtr SendMessageTimeout(
        IntPtr hWnd,
        uint msg,
        IntPtr wParam,
        IntPtr lParam,
        uint flags,
        uint timeout,
        out IntPtr result);

    [STAThread]
    private static void Main()
    {
        SendMessageTimeout(
            (IntPtr)HwndBroadcast,
            WmSyscommand,
            (IntPtr)ScMonitorpower,
            (IntPtr)MonitorOff,
            SmtoAbortifhung,
            1000,
            out _);
    }
}
