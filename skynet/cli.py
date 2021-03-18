import click

@click.group()
def cli():
   """ Welcome to Skynet, this is a personal passion project!! """ 

@cli.command()
def check():
   click.echo("Hello from skynet - this is a test message")
