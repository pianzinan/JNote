import org.pegdown.PegDownProcessor;


public class Test
{
	public static void main(String[] args)
	{
		String text = "Setext方式\n标题1\n=================\n\n标题2\n-----------------\n\nAtx方式\n# 标题1\n## 标题2\n###### 标题6";
		long t = System.currentTimeMillis();
		PegDownProcessor processor = new PegDownProcessor();
		System.out.println(System.currentTimeMillis() - t);
		text = processor.markdownToHtml(text);
		System.out.println(text);
	}
}
