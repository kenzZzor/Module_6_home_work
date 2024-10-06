public interface IReportBuilder
{
    void SetHeader(string header);
    void SetContent(string content);
    void SetFooter(string footer);
    Report GetReport();
}

public class TextReportBuilder : IReportBuilder
{
    private Report _report;

    public TextReportBuilder()
    {
        _report = new Report();
    }

    public void SetHeader(string header)
    {
        _report.Header = header;
    }

    public void SetContent(string content)
    {
        _report.Content = content;
    }

    public void SetFooter(string footer)
    {
        _report.Footer = footer;
    }

    public Report GetReport()
    {
        return _report;
    }
}

public class HtmlReportBuilder : IReportBuilder
{
    private Report _report;

    public HtmlReportBuilder()
    {
        _report = new Report();
    }

    public void SetHeader(string header)
    {
        _report.Header = $"<h1>{header}</h1>";
    }

    public void SetContent(string content)
    {
        _report.Content = $"<p>{content}</p>";
    }

    public void SetFooter(string footer)
    {
        _report.Footer = $"<footer>{footer}</footer>";
    }

    public Report GetReport()
    {
        return _report;
    }
}

public class Report
{
    public string Header { get; set; }
    public string Content { get; set; }
    public string Footer { get; set; }

    // Метод для отображения отчёта
    public void Show()
    {
        Console.WriteLine(Header);
        Console.WriteLine(Content);
        Console.WriteLine(Footer);
    }
}
public class ReportDirector
{
    public void ConstructReport(IReportBuilder builder, string header, string content, string footer)
    {
        builder.SetHeader(header);
        builder.SetContent(content);
        builder.SetFooter(footer);
    }
}

class Program
{
    static void Main(string[] args)
    {
        IReportBuilder textBuilder = new TextReportBuilder();
        ReportDirector director = new ReportDirector();
        director.ConstructReport(textBuilder, "Text Report Header", "This is the content of the text report.", "Text Report Footer");
        Report textReport = textBuilder.GetReport();
        textReport.Show();

        Console.WriteLine("\n----------------------------\n");

        IReportBuilder htmlBuilder = new HtmlReportBuilder();
        director.ConstructReport(htmlBuilder, "HTML Report Header", "This is the content of the HTML report.", "HTML Report Footer");
        Report htmlReport = htmlBuilder.GetReport();
        htmlReport.Show();
    }
}
